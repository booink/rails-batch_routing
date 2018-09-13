# BulkRouting
add bulk_create, bulk_update, bulk_destroy to Rails routes

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'bulk_routing'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bulk_routing
```

## Usage
Example

```ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :articles, bulk: [:create, :update, :destroy]
end
```

and, show `rails routes`

```
                Prefix Verb   URI Pattern                   Controller#Action
  bulk_create_articles POST   /articles/bulk(.:format)      articles#bulk_create
  bulk_update_articles PUT    /articles/bulk(.:format)      articles#bulk_update
 bulk_destroy_articles DELETE /articles/bulk(.:format)      articles#bulk_destroy
              articles GET    /articles(.:format)           articles#index
                       POST   /articles(.:format)           articles#create
           new_article GET    /articles/new(.:format)       articles#new
          edit_article GET    /articles/:id/edit(.:format)  articles#edit
               article GET    /articles/:id(.:format)       articles#show
                       PATCH  /articles/:id(.:format)       articles#update
                       PUT    /articles/:id(.:format)       articles#update
                       DELETE /articles/:id(.:format)       articles#destroy
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/booink/rails-bulk_routing

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
