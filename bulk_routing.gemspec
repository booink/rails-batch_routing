$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'bulk_routing/version'

Gem::Specification.new do |s|
  s.name        = 'bulk_routing'
  s.version     = BulkRouting::VERSION
  s.authors     = ['booink']
  s.email       = ['booink.work@gmail.com']
  s.homepage    = 'https://github.com/booink/rails-bulk_routing'
  s.summary     = 'bulk processing routing for Rails'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'actionpack', '>= 5.0.0'

  s.add_development_dependency 'rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'combustion'
end
