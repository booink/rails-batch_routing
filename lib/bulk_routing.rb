# When you use BulkRouting, bulk_* routes becomes possible.
module BulkRouting
  # patch to ActionDispatch::Routing::Mapper
  module Resources
    # patch to ActionDispatch::Routing::Mapper::Resources::Resource
    module Resource
      def initialize(entities, api_only, shallow, options = {})
        super
        @bulk = options[:bulk] || []
      end

      def actions
        actions = super
        actions += bulk_actions if @bulk
        actions
      end

      private

      def bulk_actions
        Array(@bulk).map do |action|
          "bulk_#{action}".to_sym
        end
      end
    end

    BULK_ACTIONS = %w[bulk_create bulk_update bulk_destroy].freeze

    def resources(*resources, &block)
      super do
        yield if block_given?

        actions = parent_resource.actions
        collection do
          post   :bulk_create if actions.include?(:bulk_create)
          put    :bulk_update if actions.include?(:bulk_update)
          delete :bulk_destroy if actions.include?(:bulk_destroy)
        end
      end
    end

    private

    def bulk_action?(action)
      resource_method_scope? && BULK_ACTIONS.include?(action.to_s)
    end

    def path_for_action(action, path)
      if bulk_action?(action)
        "#{@scope[:path]}/bulk"
      else
        super
      end
    end
  end
end

# rubocop:disable Style/Documentation
module ActionDispatch
  module Routing
    class Mapper
      prepend BulkRouting::Resources
      module Resources
        remove_const(:RESOURCE_OPTIONS)
        RESOURCE_OPTIONS = %i[as controller path only
                              except param concerns bulk].freeze

        class Resource
          prepend BulkRouting::Resources::Resource
        end
      end
    end
  end
end
# rubocop:enable Style/Documentation
