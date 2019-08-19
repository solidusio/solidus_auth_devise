Solidus Auth (Devise)
=====================

[![CircleCI](https://circleci.com/gh/solidusio/solidus_auth_devise.svg?style=svg)](https://circleci.com/gh/solidusio/solidus_auth_devise)

Provides authentication services for Solidus, using the Devise gem.

Installation
------------

Just add this line to your `Gemfile`:

```ruby
gem "solidus_auth_devise"

# For Solidus versions < 2.5
# gem 'deface'
```

Then, run `bundle install`.

After that's done, you can install and run the necessary migrations, then seed the database:

```shell
bundle exec rake solidus_auth:install:migrations
bundle exec rake db:migrate
bundle exec rake db:seed
```

### Default Username/Password

As part of running the above installation steps, you will be asked to set an admin email/password combination. The default values are `admin@example.com` and `test123`, respectively.

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

Run the following to automatically build a dummy app if necessary and run the tests:

```shell
bundle exec rake
```

## Releasing a new version

#### 1. Bump gem version and push to RubyGems

We use [gem-release](https://github.com/svenfuchs/gem-release) to release this
extension with ease.

Supposing you are on the master branch and you are working on a fork of this
extension, `upstream` is the main remote and you have write access to it, you
can simply run:

```bash
gem bump --version minor --tag --release
```

This command will:

- bump the gem version to the next minor (changing the `version.rb` file)
- commit the change and push it to upstream master
- create a git tag
- push the tag to the upstream remote
- release the new version on RubyGems

Or you can run these commands individually:

```bash
gem bump --version minor
gem tag
gem release
```

#### 2. Publish the updated CHANGELOG

After the release is done we can generate the updated CHANGELOG
using
[github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator)
by running the following command:


```bash
bundle exec github_changelog_generator solidusio/solidus_auth_devise --token YOUR_GITHUB_TOKEN
git commit -am 'Update CHANGELOG'
git push upstream master
```
