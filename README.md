Solidus Auth (Devise)
=====================

Provides authentication services for Solidus, using the Devise gem.

Installation
------------

Just add this line to your `Gemfile`:
```ruby
gem "solidus_auth_devise"
```

Then run `bundle install`.

### Confirmable

To enable Devise's Confirmable module, which will send the user an email with a link to confirm their account, you must do the following:

* Add this line to an initializer in your Rails project (typically `config/initializers/spree.rb`):
```ruby
Spree::Auth::Config[:confirmable] = true
```

* Add a Devise initializer to your Rails project (typically `config/initializers/devise.rb`):
```ruby
Devise.setup do |config|
  # Required so users don't lose their carts when they need to confirm.
  config.allow_unconfirmed_access_for = 1.days

  # Fixes the bug where Confirmation errors result in a broken page.
  config.router_name = :spree

  # Add any other devise configurations here, as they will override the defaults provided by solidus_auth_devise.
end
```

Using in an existing application
--------------------------------

If you are installing Solidus inside of a host application in which you want your own permission setup, you can do this using the `register_ability` method.

First create your own CanCan Ability class following the CanCan documentation.

For example: `app/models/super_abilities.rb`

```ruby
class SuperAbilities
  include CanCan::Ability

  def initialize user
    if user.is? "Superman"
      can :stop, Bullet
    end
  end
end
```

Then register your class in your spree initializer: config/initializers/spree.rb
```ruby
Spree::Ability.register_ability(SuperAbilities)
```

Inside of your host application you can then use CanCan like you normally would.
```erb
<% if can? :stop Bullet %>
  ...
<% end %>
```

Testing
-------

Until Solidus is publicly available, the easiest way to satisfy the Solidus dependancy is with a local Bundler override:

```shell
bundle config local.spree /path/to/local/solidus/repository
```

Then just run the following to automatically build a dummy app if necessary and run the tests:

```shell
bundle exec rake
```
