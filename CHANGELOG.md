## Master (unreleased)

## Solidus Auth Devise v1.6.3 (2017-05-09)

* Add missing translations for already_authenticated
* Do not require core email validator
* Remove dependency on `json`, `multi_json`
* Remove unnecessary sass/coffeescript requires
* Fix warnings on Rails 5, support Rails 5.1
* Change deface dependency from `~> 1.0.0` to `~> 1.0`

## Solidus Auth Devise v1.6.2 (2016-11-18)

* Fix an issue where invalid addresses could be persisted after starting a
  checkout as a guest and then returning to the cart page.

## Solidus Auth Devise v1.6.1 (2016-08-24)

* Replace usages of `before_filter` with `before_action` (#73)

## Solidus Auth Devise v1.6.0 (2016-08-23)

* Loading of routes can be disabled through config (#71)

* Support for Solidus 2.0 and Rails 5.0

* Remove load-time manipulation of the Devise secret key (#67)

## Solidus Auth Devise v1.5.0 (2016-07-18)

* Add call to set_current_order on sign in. This replaces a before filter that
  is being eliminated from Solidus controllers where set_current_order was
  called excessively.

* Update backend views to only reference backend routes (#57)

* Devise dependency updates

  The locked versions of Devise and Devise-Encryptable have been updated.
  Devise, in particular, has been bumped to a new major version, which removes
  support for the following:

  - Rails 3.2. and 4.0
  - Ruby 1.9 and 2.0

  These losses are deemed acceptable, as Solidus' core itself does not
  support any of these versions.

  For more details on the changes, see the Devise changelog:
  https://github.com/plataformatec/devise/blob/master/CHANGELOG.md

  Similar changes in `devise-encryptable`, with details in the changelog:
  https://github.com/plataformatec/devise-encryptable/blob/master/Changelog.md

* Addition of Chinese translations (#64)

## Solidus Auth Devise v1.4.0 (2016-05-16)

* Update hash syntax for routes.rb
* Make route syntax consistent and modern
* Make devise_for routes conditional
* Test against solidus 1.3
* check_authorization first in CheckoutController
* Ensure current_order exists checking registration
* Add vendor to .gitignore
* Revert "ChcktController checks auth and registration first"
* ChcktController checks auth and registration first
* Remove obsolete regression test
* Remove superfluous call to associate_user
* Test and fix order association
* Re-add Solidus 1.0 compatability
* Improve readability of check_registration
* Force registration when guest checkout not allowed
* Improve check_registration spec for guest case
* Add pg and mysql2 to Gemfile
* Also test against v1.1 and v1.2
* Allow https instead of git in gemfile
* Ignore pkg directory
* Update .travis.yml
* Update README testing section
* Fix specs now that order's store is required
* Moved the encryptor setting for the User model into the devise config, allowing it to be easily overridden from the local devise config.

## Solidus Auth Devise v1.3.0 (2016-01-12)

* Add capybara-screenshot
* Remove restriction on sass-rails and coffee-rails
* Remove the "Logged in as:" message
* Correct use of font-awesome
* Swap .inline-menu for specific hook
* Add new template override
* remove duplicate translation
* add missing translations for German locale

## Solidus Auth Devise v1.2.3 (2015-11-30)

* Add an explicit require to deface
* Check if front/backend are available before decorating the controllers
* Rename spree@example.com to admin@example.com
* Skip the confirmation spec
* Permit editing email

## Solidus Auth Devise v1.2.2 (2015-10-01)

* Automatically regenerate a user's spree_api_key upon password change.
* Inherit from Spree::Base
* Explicitely add deface to gemfile
* Remove some redundant includes
* Remove unneeded monkey patching
* Remove brittle spec
* Pass store to from_address helper
* Fix broken specs

## Solidus Auth Devise v1.2.0 (2015-07-22)

* Use new extension point for access denied.
* Explicitly include UserMethods on Spree::User
* Bump rspec to 3.3 and remove minor patch restriction.
* We no longer redirect to admin/orders by default.
* Skip adding devise.rb if it already exists.
* Fix checkout spec
* Bump to RSpec 3.2
* Use non-deprecated `deliver_now` in mailer spec.
* Fix generator name.

## Solidus Auth Devise v1.1.0 (2015-06-03)

* Updates for devise 3.5.1
* Bump devise to ~> 3.5.1
* Avoid stubbing to fix checkout spec
* Minor update to README.md
* Remove Spree::Core::ControllerHelpers::SSL
* Add circle.yml
* Use git+ssh for solidus gem
* Remove dead code.
* Refactor UserSessionsController and specs
* Remove @user from UserRegistrationsController
* Add specs for UserRegistrationsController
* Remove empty overrides in registrations controller

## Solidus Auth Devise v1.0.0 (2015-05-26)

* Initial Release
