require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'routes for Article', type: :routing do
  describe 'routes /articles to the articles controller' do
    it '#index' do
      expect(get('/articles'))
        .to route_to(controller: 'articles', action: 'index')
    end

    it '#show' do
      expect(get('/articles/1'))
        .to route_to(controller: 'articles', action: 'show', id: '1')
    end

    it '#new' do
      expect(get('/articles/new'))
        .to route_to(controller: 'articles', action: 'new')
    end

    it '#edit' do
      expect(get('/articles/1/edit'))
        .to route_to(controller: 'articles', action: 'edit', id: '1')
    end

    it '#create' do
      expect(post('/articles'))
        .to route_to(controller: 'articles', action: 'create')
    end

    it '#update' do
      expect(put('/articles/1'))
        .to route_to(controller: 'articles', action: 'update', id: '1')
    end

    it '#destroy' do
      expect(delete('/articles/1'))
        .to route_to(controller: 'articles', action: 'destroy', id: '1')
    end

    it '#bulk_create' do
      expect(post('/articles/bulk'))
        .to route_to(controller: 'articles', action: 'bulk_create')
    end

    it '#bulk_update' do
      expect(put('/articles/bulk'))
        .to route_to(controller: 'articles', action: 'bulk_update')
    end

    it '#bulk_destroy' do
      expect(delete('/articles/bulk'))
        .to route_to(controller: 'articles', action: 'bulk_destroy')
    end
  end
end
# rubocop:enable Metrics/BlockLength
