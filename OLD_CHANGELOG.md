# Changelog

## [v2.5.7](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.7) (2022-10-31)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.5.6...v2.5.7)

**Merged pull requests:**

- Fix the standard generator alias and remove interactivity from seeds [\#233](https://github.com/solidusio/solidus_auth_devise/pull/233) ([elia](https://github.com/elia))

## [v2.5.6](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.6) (2022-09-30)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.5.5...v2.5.6)

**Merged pull requests:**

- Revert "Utilize Devise location helpers for redirecting" [\#232](https://github.com/solidusio/solidus_auth_devise/pull/232) ([elia](https://github.com/elia))
- Run the CI on all supported ruby versions [\#229](https://github.com/solidusio/solidus_auth_devise/pull/229) ([elia](https://github.com/elia))
- Utilize Devise location helpers for redirecting [\#228](https://github.com/solidusio/solidus_auth_devise/pull/228) ([cpfergus1](https://github.com/cpfergus1))
- Update to use forked solidus\_frontend when needed [\#227](https://github.com/solidusio/solidus_auth_devise/pull/227) ([waiting-for-dev](https://github.com/waiting-for-dev))
- Fix keyword usage for Ruby 3.x support on specs [\#226](https://github.com/solidusio/solidus_auth_devise/pull/226) ([jtapia](https://github.com/jtapia))
- Fix locale inconsistence and remove redundant template [\#224](https://github.com/solidusio/solidus_auth_devise/pull/224) ([bitberry-dev](https://github.com/bitberry-dev))
- Specs and setup process housekeeping [\#222](https://github.com/solidusio/solidus_auth_devise/pull/222) ([elia](https://github.com/elia))
- Stop using try\_spree\_current\_user [\#221](https://github.com/solidusio/solidus_auth_devise/pull/221) ([elia](https://github.com/elia))
- Update to the latest solidus\_dev\_support defaults [\#220](https://github.com/solidusio/solidus_auth_devise/pull/220) ([elia](https://github.com/elia))
- Fix build [\#219](https://github.com/solidusio/solidus_auth_devise/pull/219) ([gsmendoza](https://github.com/gsmendoza))

## [v2.5.5](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.5) (2022-09-19)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.5.4...v2.5.5)

## [v2.5.4](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.4) (2021-11-17)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.5.3...v2.5.4)

**Closed issues:**

- This line doesn't do anything [\#214](https://github.com/solidusio/solidus_auth_devise/issues/214)

**Merged pull requests:**

- Bump version and update changelog [\#217](https://github.com/solidusio/solidus_auth_devise/pull/217) ([waiting-for-dev](https://github.com/waiting-for-dev))
- Remove line that doesn't do anything [\#215](https://github.com/solidusio/solidus_auth_devise/pull/215) ([jarednorman](https://github.com/jarednorman))
- Allow using auth\_devise with discard [\#209](https://github.com/solidusio/solidus_auth_devise/pull/209) ([kennyadsl](https://github.com/kennyadsl))

## [v2.5.3](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.3) (2021-01-29)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.5.2...v2.5.3)

**Fixed bugs:**

- Infinte redirection on password change [\#202](https://github.com/solidusio/solidus_auth_devise/issues/202)

**Merged pull requests:**

- Explicitely require paranoia when needed [\#207](https://github.com/solidusio/solidus_auth_devise/pull/207) ([kennyadsl](https://github.com/kennyadsl))
- Allow Solidus 3 version [\#205](https://github.com/solidusio/solidus_auth_devise/pull/205) ([peterberkenbosch](https://github.com/peterberkenbosch))
- Fixes \#202 : infinite redirection bug on password change [\#204](https://github.com/solidusio/solidus_auth_devise/pull/204) ([nomad-mando](https://github.com/nomad-mando))
- Relax Ruby required version to support Ruby 3.0+ [\#203](https://github.com/solidusio/solidus_auth_devise/pull/203) ([filippoliverani](https://github.com/filippoliverani))

## [v2.5.2](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.2) (2020-11-11)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.5.1...v2.5.2)

**Implemented enhancements:**

-  Replace `I18n.t` with `t` in views [\#200](https://github.com/solidusio/solidus_auth_devise/pull/200) ([spaghetticode](https://github.com/spaghetticode))

**Merged pull requests:**

- Update migrations to support Rails 5.1 [\#201](https://github.com/solidusio/solidus_auth_devise/pull/201) ([brchristian](https://github.com/brchristian))
- Point to Solidus wiki for gem release [\#199](https://github.com/solidusio/solidus_auth_devise/pull/199) ([spaghetticode](https://github.com/spaghetticode))

## [v2.5.1](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.1) (2020-10-23)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.5.0...v2.5.1)

**Closed issues:**

- Asset compilation crashes on 2.5.0 [\#196](https://github.com/solidusio/solidus_auth_devise/issues/196)

**Merged pull requests:**

- Use proper name for add\_migrations [\#198](https://github.com/solidusio/solidus_auth_devise/pull/198) ([peterberkenbosch](https://github.com/peterberkenbosch))
- Move AuthConfiguration out of autoloading paths [\#197](https://github.com/solidusio/solidus_auth_devise/pull/197) ([elia](https://github.com/elia))

## [v2.5.0](https://github.com/solidusio/solidus_auth_devise/tree/v2.5.0) (2020-10-07)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.4.0...v2.5.0)

**Implemented enhancements:**

- Remove admin orders controller specs [\#195](https://github.com/solidusio/solidus_auth_devise/pull/195) ([kennyadsl](https://github.com/kennyadsl))
- Redirect back if not authorized [\#192](https://github.com/solidusio/solidus_auth_devise/pull/192) ([kennyadsl](https://github.com/kennyadsl))

**Closed issues:**

- Zeitwerk::NameError [\#193](https://github.com/solidusio/solidus_auth_devise/issues/193)
- Rails 6 and Solidus AuthDevise issues? [\#189](https://github.com/solidusio/solidus_auth_devise/issues/189)
- Cant locate devise.rb file to locate secret key. [\#188](https://github.com/solidusio/solidus_auth_devise/issues/188)
- RuntimeError: Can't modify frozen hash [\#184](https://github.com/solidusio/solidus_auth_devise/issues/184)
- Bug: NameError [\#174](https://github.com/solidusio/solidus_auth_devise/issues/174)
- `devise.user_registrations` key is not the same in the view [\#119](https://github.com/solidusio/solidus_auth_devise/issues/119)
- The update action of the password controller from devise makes my app go into a loop. [\#78](https://github.com/solidusio/solidus_auth_devise/issues/78)

**Merged pull requests:**

- Add option to skip migrations [\#194](https://github.com/solidusio/solidus_auth_devise/pull/194) ([seand7565](https://github.com/seand7565))
- Bump solidus\_support to latest 0.5 release [\#191](https://github.com/solidusio/solidus_auth_devise/pull/191) ([peterberkenbosch](https://github.com/peterberkenbosch))
- Fix tests for Devise's :confirmable module [\#190](https://github.com/solidusio/solidus_auth_devise/pull/190) ([aldesantis](https://github.com/aldesantis))
- Fix chrome warnings [\#187](https://github.com/solidusio/solidus_auth_devise/pull/187) ([coorasse](https://github.com/coorasse))
- Fill address names combined when needed [\#186](https://github.com/solidusio/solidus_auth_devise/pull/186) ([kennyadsl](https://github.com/kennyadsl))
- Allow to really\_destroy! users [\#185](https://github.com/solidusio/solidus_auth_devise/pull/185) ([skukx](https://github.com/skukx))
- Add paranoia dependency explicitly [\#183](https://github.com/solidusio/solidus_auth_devise/pull/183) ([cedum](https://github.com/cedum))
- Adopt conditional code loading from solidus\_support [\#182](https://github.com/solidusio/solidus_auth_devise/pull/182) ([aldesantis](https://github.com/aldesantis))
- Upgrade infrastructure with solidus\_dev\_support [\#181](https://github.com/solidusio/solidus_auth_devise/pull/181) ([aldesantis](https://github.com/aldesantis))
- Add support for Zeitwerk [\#180](https://github.com/solidusio/solidus_auth_devise/pull/180) ([kennyadsl](https://github.com/kennyadsl))
- Fix feature\_helper require [\#179](https://github.com/solidusio/solidus_auth_devise/pull/179) ([omnistegan](https://github.com/omnistegan))
- Update postgresql variable name to reflect CircleCI config [\#177](https://github.com/solidusio/solidus_auth_devise/pull/177) ([kennyadsl](https://github.com/kennyadsl))

## [v2.4.0](https://github.com/solidusio/solidus_auth_devise/tree/v2.4.0) (2019-11-18)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.3.0...v2.4.0)

**Implemented enhancements:**

- Add an automatic CHANGELOG generator [\#154](https://github.com/solidusio/solidus_auth_devise/issues/154)

**Closed issues:**

- Rails 6, Production only issue, works fine in dev, tripped up assets:precompile build process on Heroku, compiled fine locally. [\#175](https://github.com/solidusio/solidus_auth_devise/issues/175)
- Spree.user\_class not using my specific class [\#169](https://github.com/solidusio/solidus_auth_devise/issues/169)
- Missing `config.secret_key_base` from default devise.rb? [\#33](https://github.com/solidusio/solidus_auth_devise/issues/33)

**Merged pull requests:**

- Fixes for Zeitwerk [\#176](https://github.com/solidusio/solidus_auth_devise/pull/176) ([kennyadsl](https://github.com/kennyadsl))
- Update it translations [\#172](https://github.com/solidusio/solidus_auth_devise/pull/172) ([delphaber](https://github.com/delphaber))
- Relax sqlite3 dependency for Rails 6 support [\#170](https://github.com/solidusio/solidus_auth_devise/pull/170) ([aldesantis](https://github.com/aldesantis))
- Allow admins to reset an user's password through the admin panel [\#146](https://github.com/solidusio/solidus_auth_devise/pull/146) ([aitbw](https://github.com/aitbw))

## [v2.3.0](https://github.com/solidusio/solidus_auth_devise/tree/v2.3.0) (2019-08-19)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.2.0...v2.3.0)

**Closed issues:**

- Any plans to release to RubyGems? [\#147](https://github.com/solidusio/solidus_auth_devise/issues/147)

**Merged pull requests:**

- Add GitHub changelog generator [\#168](https://github.com/solidusio/solidus_auth_devise/pull/168) ([kennyadsl](https://github.com/kennyadsl))
- Fix CI issues [\#167](https://github.com/solidusio/solidus_auth_devise/pull/167) ([kennyadsl](https://github.com/kennyadsl))
- Stub preferences in specs instead of resetting [\#166](https://github.com/solidusio/solidus_auth_devise/pull/166) ([kennyadsl](https://github.com/kennyadsl))
- Add appropriate classes to admin login button [\#164](https://github.com/solidusio/solidus_auth_devise/pull/164) ([jacobeubanks](https://github.com/jacobeubanks))
- Extension maintenance  [\#163](https://github.com/solidusio/solidus_auth_devise/pull/163) ([kennyadsl](https://github.com/kennyadsl))
- Fix minor grammar concerns in console messages [\#162](https://github.com/solidusio/solidus_auth_devise/pull/162) ([jacobherrington](https://github.com/jacobherrington))
- Logout with DELETE verb by default [\#161](https://github.com/solidusio/solidus_auth_devise/pull/161) ([kennyadsl](https://github.com/kennyadsl))
- Use secret\_key\_base for Rails 6 compatibility [\#160](https://github.com/solidusio/solidus_auth_devise/pull/160) ([aldesantis](https://github.com/aldesantis))
- Improve decorators [\#159](https://github.com/solidusio/solidus_auth_devise/pull/159) ([jacobherrington](https://github.com/jacobherrington))
- Add rubocop as a development dependency [\#158](https://github.com/solidusio/solidus_auth_devise/pull/158) ([jacobherrington](https://github.com/jacobherrington))
- Update confusing i18n translation [\#157](https://github.com/solidusio/solidus_auth_devise/pull/157) ([jacobherrington](https://github.com/jacobherrington))
- Remove flash errors from password recovery [\#156](https://github.com/solidusio/solidus_auth_devise/pull/156) ([jacobherrington](https://github.com/jacobherrington))
- Remove flash errors from admin password recovery [\#155](https://github.com/solidusio/solidus_auth_devise/pull/155) ([jacobherrington](https://github.com/jacobherrington))
- Introduce Rubocop for linting [\#148](https://github.com/solidusio/solidus_auth_devise/pull/148) ([aitbw](https://github.com/aitbw))

## [v2.2.0](https://github.com/solidusio/solidus_auth_devise/tree/v2.2.0) (2019-06-13)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.1.0...v2.2.0)

**Closed issues:**

- Any plan for replacing paranoia with discard? [\#129](https://github.com/solidusio/solidus_auth_devise/issues/129)
- rake task solidus\_auth:install:migrations [\#121](https://github.com/solidusio/solidus_auth_devise/issues/121)
- Issue redirecting to Spree routes [\#100](https://github.com/solidusio/solidus_auth_devise/issues/100)
- Requiring gem, on API only projects, throws LoadError \(sass/rails\) [\#88](https://github.com/solidusio/solidus_auth_devise/issues/88)
- db index on reset\_password\_token missing [\#83](https://github.com/solidusio/solidus_auth_devise/issues/83)
- Let's use more Devise defaults for routing [\#55](https://github.com/solidusio/solidus_auth_devise/issues/55)
- Fix confirmation\_spec [\#24](https://github.com/solidusio/solidus_auth_devise/issues/24)

**Merged pull requests:**

- Add v2.2.0 CHANGELOG entries [\#153](https://github.com/solidusio/solidus_auth_devise/pull/153) ([kennyadsl](https://github.com/kennyadsl))
- Add gem-release support [\#152](https://github.com/solidusio/solidus_auth_devise/pull/152) ([kennyadsl](https://github.com/kennyadsl))
- Add missing pessimistic versioning [\#149](https://github.com/solidusio/solidus_auth_devise/pull/149) ([aitbw](https://github.com/aitbw))
- Remove CircleCI configuration file [\#145](https://github.com/solidusio/solidus_auth_devise/pull/145) ([kennyadsl](https://github.com/kennyadsl))
-  Fix migration `20101026184950` `down` method [\#144](https://github.com/solidusio/solidus_auth_devise/pull/144) ([spaghetticode](https://github.com/spaghetticode))
- Run specs on CircleCi with shared configuration [\#143](https://github.com/solidusio/solidus_auth_devise/pull/143) ([kennyadsl](https://github.com/kennyadsl))
- Lock SQLite3 to version 1.3 [\#142](https://github.com/solidusio/solidus_auth_devise/pull/142) ([aitbw](https://github.com/aitbw))
- Add Solidus v2.8 to Travis config [\#141](https://github.com/solidusio/solidus_auth_devise/pull/141) ([aitbw](https://github.com/aitbw))
- Add DB index to `reset_password_token` field [\#140](https://github.com/solidusio/solidus_auth_devise/pull/140) ([spaghetticode](https://github.com/spaghetticode))
- Remove warnings [\#139](https://github.com/solidusio/solidus_auth_devise/pull/139) ([jtapia](https://github.com/jtapia))
- Add missing translation [\#137](https://github.com/solidusio/solidus_auth_devise/pull/137) ([spaghetticode](https://github.com/spaghetticode))
- Allow Spree::Admin::UserPasswordsController to be accessed from admin… [\#136](https://github.com/solidusio/solidus_auth_devise/pull/136) ([acreilly](https://github.com/acreilly))
- Fix typo of french locale [\#135](https://github.com/solidusio/solidus_auth_devise/pull/135) ([imfaruk](https://github.com/imfaruk))
- Remove Solidus v2.2 support from Travis config [\#134](https://github.com/solidusio/solidus_auth_devise/pull/134) ([aitbw](https://github.com/aitbw))
- Replace Spree.t with I18n.t [\#132](https://github.com/solidusio/solidus_auth_devise/pull/132) ([aitbw](https://github.com/aitbw))
- Fix to not reuse spree\_current\_user as `@user` [\#131](https://github.com/solidusio/solidus_auth_devise/pull/131) ([yono](https://github.com/yono))
- Fix factory girl dependency for Solidus \< 2.5 [\#130](https://github.com/solidusio/solidus_auth_devise/pull/130) ([tvdeyen](https://github.com/tvdeyen))
- Add Solidus v2.7 to .travis.yml [\#127](https://github.com/solidusio/solidus_auth_devise/pull/127) ([jacobherrington](https://github.com/jacobherrington))
- Fix spree routes [\#125](https://github.com/solidusio/solidus_auth_devise/pull/125) ([jtapia](https://github.com/jtapia))
- Remove unnecessary decorator [\#122](https://github.com/solidusio/solidus_auth_devise/pull/122) ([jhawthorn](https://github.com/jhawthorn))
- Disable backend footer profile edit link if role cannot edit users [\#120](https://github.com/solidusio/solidus_auth_devise/pull/120) ([cringegnere](https://github.com/cringegnere))

## [v2.1.0](https://github.com/solidusio/solidus_auth_devise/tree/v2.1.0) (2018-01-22)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v2.0.0...v2.1.0)

**Closed issues:**

- Error undefined method alias\_method\_chain [\#112](https://github.com/solidusio/solidus_auth_devise/issues/112)

**Merged pull requests:**

- Remove unused helper include [\#118](https://github.com/solidusio/solidus_auth_devise/pull/118) ([jhawthorn](https://github.com/jhawthorn))
- update spec according new solidus behaviour for 404 [\#115](https://github.com/solidusio/solidus_auth_devise/pull/115) ([ccarruitero](https://github.com/ccarruitero))
- Don't require deface for solidus 2.5+ [\#114](https://github.com/solidusio/solidus_auth_devise/pull/114) ([jhawthorn](https://github.com/jhawthorn))
- Test that we are acting as paranoid not it's behaviour [\#113](https://github.com/solidusio/solidus_auth_devise/pull/113) ([tvdeyen](https://github.com/tvdeyen))
- Reset api key when assigning password [\#99](https://github.com/solidusio/solidus_auth_devise/pull/99) ([jhawthorn](https://github.com/jhawthorn))
- RFC: Support Backend-Only Stores [\#96](https://github.com/solidusio/solidus_auth_devise/pull/96) ([stewart](https://github.com/stewart))

## [v2.0.0](https://github.com/solidusio/solidus_auth_devise/tree/v2.0.0) (2017-09-20)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.6.4...v2.0.0)

**Merged pull requests:**

- Drop Solidus v1.0, v1.1 support [\#111](https://github.com/solidusio/solidus_auth_devise/pull/111) ([swcraig](https://github.com/swcraig))
- Stop raising an exception when callback in UsersController is undefined [\#110](https://github.com/solidusio/solidus_auth_devise/pull/110) ([swcraig](https://github.com/swcraig))
- Add ffaker dependency to gemspec [\#109](https://github.com/solidusio/solidus_auth_devise/pull/109) ([swcraig](https://github.com/swcraig))
- Remove has\_many orders [\#107](https://github.com/solidusio/solidus_auth_devise/pull/107) ([jhawthorn](https://github.com/jhawthorn))
- Use base spec\_helper from solidus\_support [\#106](https://github.com/solidusio/solidus_auth_devise/pull/106) ([jhawthorn](https://github.com/jhawthorn))
- Extract \*\_available? to solidus\_support [\#105](https://github.com/solidusio/solidus_auth_devise/pull/105) ([jhawthorn](https://github.com/jhawthorn))
- Remove references to dash [\#104](https://github.com/solidusio/solidus_auth_devise/pull/104) ([jhawthorn](https://github.com/jhawthorn))
- match logout route to devise configuration [\#103](https://github.com/solidusio/solidus_auth_devise/pull/103) ([BenMorganIO](https://github.com/BenMorganIO))

## [v1.6.4](https://github.com/solidusio/solidus_auth_devise/tree/v1.6.4) (2017-07-24)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.6.3...v1.6.4)

**Closed issues:**

- Adding omniauthable to to Spree::User [\#98](https://github.com/solidusio/solidus_auth_devise/issues/98)
- Use of `helper_method` should be wrapped in `respond_to?` check [\#90](https://github.com/solidusio/solidus_auth_devise/issues/90)
- Deface Override requires solidus\_frontend [\#85](https://github.com/solidusio/solidus_auth_devise/issues/85)

**Merged pull requests:**

- Seed improvements [\#102](https://github.com/solidusio/solidus_auth_devise/pull/102) ([cbrunsdon](https://github.com/cbrunsdon))
- Only apply frontend override if frontend present [\#95](https://github.com/solidusio/solidus_auth_devise/pull/95) ([stewart](https://github.com/stewart))
- Update outdated development dependencies [\#94](https://github.com/solidusio/solidus_auth_devise/pull/94) ([stewart](https://github.com/stewart))
- Remove use of deprecated `bypass` opt for sign\_in [\#93](https://github.com/solidusio/solidus_auth_devise/pull/93) ([stewart](https://github.com/stewart))
- Wrap use of `helper_method` in `respond_to?` [\#92](https://github.com/solidusio/solidus_auth_devise/pull/92) ([stewart](https://github.com/stewart))
- Remove unused line [\#75](https://github.com/solidusio/solidus_auth_devise/pull/75) ([Murph33](https://github.com/Murph33))

## [v1.6.3](https://github.com/solidusio/solidus_auth_devise/tree/v1.6.3) (2017-05-09)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.6.2...v1.6.3)

**Merged pull requests:**

- Remove dependency on json, multi\_json [\#91](https://github.com/solidusio/solidus_auth_devise/pull/91) ([jhawthorn](https://github.com/jhawthorn))
- Remove Unnecessary `require` statements. [\#89](https://github.com/solidusio/solidus_auth_devise/pull/89) ([stewart](https://github.com/stewart))
- Do not require core email validator [\#87](https://github.com/solidusio/solidus_auth_devise/pull/87) ([tvdeyen](https://github.com/tvdeyen))
- Fix warnings on Rails 5.0, support Rails 5.1 [\#86](https://github.com/solidusio/solidus_auth_devise/pull/86) ([jhawthorn](https://github.com/jhawthorn))
- Change deface dependency from `~> 1.0.0` to `~> 1.0` [\#81](https://github.com/solidusio/solidus_auth_devise/pull/81) ([jordan-brough](https://github.com/jordan-brough))
- Switch to rails 5 spec keyword request syntax [\#80](https://github.com/solidusio/solidus_auth_devise/pull/80) ([jhawthorn](https://github.com/jhawthorn))
- Add missing translations for already\_authenticated [\#79](https://github.com/solidusio/solidus_auth_devise/pull/79) ([vladstoick](https://github.com/vladstoick))

## [v1.6.2](https://github.com/solidusio/solidus_auth_devise/tree/v1.6.2) (2016-11-18)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.6.1...v1.6.2)

**Fixed bugs:**

- Don't save addresses inside update\_registration [\#76](https://github.com/solidusio/solidus_auth_devise/pull/76) ([jhawthorn](https://github.com/jhawthorn))

**Closed issues:**

- Install migration task not working [\#74](https://github.com/solidusio/solidus_auth_devise/issues/74)

**Merged pull requests:**

- Fix spec order dependencies and run in a random order [\#77](https://github.com/solidusio/solidus_auth_devise/pull/77) ([jhawthorn](https://github.com/jhawthorn))

## [v1.6.1](https://github.com/solidusio/solidus_auth_devise/tree/v1.6.1) (2016-08-24)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.6.0...v1.6.1)

**Merged pull requests:**

- Replace before\_filter with before\_action [\#73](https://github.com/solidusio/solidus_auth_devise/pull/73) ([jhawthorn](https://github.com/jhawthorn))

## [v1.6.0](https://github.com/solidusio/solidus_auth_devise/tree/v1.6.0) (2016-08-23)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.5.0...v1.6.0)

**Merged pull requests:**

- Solidus 2.0 and Rails 5 [\#72](https://github.com/solidusio/solidus_auth_devise/pull/72) ([jhawthorn](https://github.com/jhawthorn))
- Loading of routes can be disabled through config [\#71](https://github.com/solidusio/solidus_auth_devise/pull/71) ([gmacdougall](https://github.com/gmacdougall))
- Skip admin override for Solidus \>= 1.0 [\#69](https://github.com/solidusio/solidus_auth_devise/pull/69) ([jhawthorn](https://github.com/jhawthorn))
- Replace spree\_{get,post,put,delete} with normal methods [\#68](https://github.com/solidusio/solidus_auth_devise/pull/68) ([jhawthorn](https://github.com/jhawthorn))
- Remove load-time manipulation of the secret\_key [\#67](https://github.com/solidusio/solidus_auth_devise/pull/67) ([jhawthorn](https://github.com/jhawthorn))

## [v1.5.0](https://github.com/solidusio/solidus_auth_devise/tree/v1.5.0) (2016-07-18)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.4.0...v1.5.0)

**Closed issues:**

- AuthenticationHelpers reference routes that may not exist [\#59](https://github.com/solidusio/solidus_auth_devise/issues/59)
- No CHANGELOG for this repo [\#54](https://github.com/solidusio/solidus_auth_devise/issues/54)
- Latest release on GitHub is out of date [\#53](https://github.com/solidusio/solidus_auth_devise/issues/53)

**Merged pull requests:**

- Flesh out installation instructions [\#66](https://github.com/solidusio/solidus_auth_devise/pull/66) ([stewart](https://github.com/stewart))
- Correct Deprecation Errors in CI [\#65](https://github.com/solidusio/solidus_auth_devise/pull/65) ([stewart](https://github.com/stewart))
- Add Chinese translations in zh-CN.yml [\#64](https://github.com/solidusio/solidus_auth_devise/pull/64) ([chrisradford](https://github.com/chrisradford))
- Loosen devise dependency to ~\> 4.1 [\#63](https://github.com/solidusio/solidus_auth_devise/pull/63) ([jhawthorn](https://github.com/jhawthorn))
- Use routes.draw [\#62](https://github.com/solidusio/solidus_auth_devise/pull/62) ([jhawthorn](https://github.com/jhawthorn))
- Add guard for frontend-based AuthenticationHelpers [\#60](https://github.com/solidusio/solidus_auth_devise/pull/60) ([stewart](https://github.com/stewart))
- Misc: Update Dependency Versions [\#58](https://github.com/solidusio/solidus_auth_devise/pull/58) ([stewart](https://github.com/stewart))
- Backend views should only reference backend routes [\#57](https://github.com/solidusio/solidus_auth_devise/pull/57) ([bbuchalter](https://github.com/bbuchalter))
- Refactor Spree::Auth::Engine [\#56](https://github.com/solidusio/solidus_auth_devise/pull/56) ([stewart](https://github.com/stewart))
- Backend views should only reference backend routes [\#52](https://github.com/solidusio/solidus_auth_devise/pull/52) ([bbuchalter](https://github.com/bbuchalter))
- Call set\_current\_order explicitly where we need it [\#51](https://github.com/solidusio/solidus_auth_devise/pull/51) ([Murph33](https://github.com/Murph33))
- Misc: Syntax Cleanup [\#50](https://github.com/solidusio/solidus_auth_devise/pull/50) ([stewart](https://github.com/stewart))

## [v1.4.0](https://github.com/solidusio/solidus_auth_devise/tree/v1.4.0) (2016-05-16)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.3.0...v1.4.0)

**Merged pull requests:**

- Conditional routing [\#49](https://github.com/solidusio/solidus_auth_devise/pull/49) ([bbuchalter](https://github.com/bbuchalter))
- check\_authorization first in CheckoutController [\#47](https://github.com/solidusio/solidus_auth_devise/pull/47) ([bbuchalter](https://github.com/bbuchalter))
- Revert "ChcktController checks auth and registration first" [\#46](https://github.com/solidusio/solidus_auth_devise/pull/46) ([bbuchalter](https://github.com/bbuchalter))
- ChcktController checks auth and registration first [\#44](https://github.com/solidusio/solidus_auth_devise/pull/44) ([bbuchalter](https://github.com/bbuchalter))
- Remove obsolete regression test [\#43](https://github.com/solidusio/solidus_auth_devise/pull/43) ([jhawthorn](https://github.com/jhawthorn))
- Improve order association [\#42](https://github.com/solidusio/solidus_auth_devise/pull/42) ([mvz](https://github.com/mvz))
- Re-add Solidus 1.0 compatability [\#40](https://github.com/solidusio/solidus_auth_devise/pull/40) ([jhawthorn](https://github.com/jhawthorn))
- Update travis.yml [\#39](https://github.com/solidusio/solidus_auth_devise/pull/39) ([jhawthorn](https://github.com/jhawthorn))
- Honor guest checkout config [\#36](https://github.com/solidusio/solidus_auth_devise/pull/36) ([bbuchalter](https://github.com/bbuchalter))
- Update README testing section [\#35](https://github.com/solidusio/solidus_auth_devise/pull/35) ([bbuchalter](https://github.com/bbuchalter))
- Fix specs now that order's store is required [\#34](https://github.com/solidusio/solidus_auth_devise/pull/34) ([jhawthorn](https://github.com/jhawthorn))
- Moved the encryptor setting for the User model into the devise config [\#32](https://github.com/solidusio/solidus_auth_devise/pull/32) ([lukepfarrar](https://github.com/lukepfarrar))

## [v1.3.0](https://github.com/solidusio/solidus_auth_devise/tree/v1.3.0) (2016-01-12)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.2.3...v1.3.0)

**Merged pull requests:**

- Add Capybara screenshot [\#30](https://github.com/solidusio/solidus_auth_devise/pull/30) ([jhawthorn](https://github.com/jhawthorn))
- Missing translations for German locale [\#29](https://github.com/solidusio/solidus_auth_devise/pull/29) ([pedropereira](https://github.com/pedropereira))
- Admin navigation sidebar [\#28](https://github.com/solidusio/solidus_auth_devise/pull/28) ([Sinetheta](https://github.com/Sinetheta))

## [v1.2.3](https://github.com/solidusio/solidus_auth_devise/tree/v1.2.3) (2015-11-30)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.2.2...v1.2.3)

**Closed issues:**

- How to access current\_user? [\#26](https://github.com/solidusio/solidus_auth_devise/issues/26)

**Merged pull requests:**

- Add an explicit require to deface [\#27](https://github.com/solidusio/solidus_auth_devise/pull/27) ([jhawthorn](https://github.com/jhawthorn))
- Check if front/backend are available before decorating the controllers [\#25](https://github.com/solidusio/solidus_auth_devise/pull/25) ([nwittstruck](https://github.com/nwittstruck))
- Rename spree@example.com to admin@example.com [\#23](https://github.com/solidusio/solidus_auth_devise/pull/23) ([jhawthorn](https://github.com/jhawthorn))
- Fix registration errors [\#22](https://github.com/solidusio/solidus_auth_devise/pull/22) ([jhawthorn](https://github.com/jhawthorn))

## [v1.2.2](https://github.com/solidusio/solidus_auth_devise/tree/v1.2.2) (2015-10-01)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.2.0...v1.2.2)

**Closed issues:**

- Should Spree::User inherit from Spree::Base [\#18](https://github.com/solidusio/solidus_auth_devise/issues/18)

**Merged pull requests:**

- Automatically regenerate a user's spree\_api\_key upon password change. [\#21](https://github.com/solidusio/solidus_auth_devise/pull/21) ([athal7](https://github.com/athal7))
- Inherit from Spree::Base [\#20](https://github.com/solidusio/solidus_auth_devise/pull/20) ([magnusvk](https://github.com/magnusvk))
- Explicitely add deface to gemfile [\#19](https://github.com/solidusio/solidus_auth_devise/pull/19) ([cbrunsdon](https://github.com/cbrunsdon))
- Version 1.2.1 [\#17](https://github.com/solidusio/solidus_auth_devise/pull/17) ([jordan-brough](https://github.com/jordan-brough))
- Remove some redundant includes [\#16](https://github.com/solidusio/solidus_auth_devise/pull/16) ([jordan-brough](https://github.com/jordan-brough))
- Remove brittle spec [\#15](https://github.com/solidusio/solidus_auth_devise/pull/15) ([adammathys](https://github.com/adammathys))
- Fix some specs [\#14](https://github.com/solidusio/solidus_auth_devise/pull/14) ([adammathys](https://github.com/adammathys))

## [v1.2.0](https://github.com/solidusio/solidus_auth_devise/tree/v1.2.0) (2015-07-22)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.1.0...v1.2.0)

**Merged pull requests:**

- Fix spec failures after Solidus changes [\#13](https://github.com/solidusio/solidus_auth_devise/pull/13) ([Senjai](https://github.com/Senjai))
- Use new access denied extension point. [\#12](https://github.com/solidusio/solidus_auth_devise/pull/12) ([adammathys](https://github.com/adammathys))
- Skip adding devise.rb if it already exists. [\#11](https://github.com/solidusio/solidus_auth_devise/pull/11) ([adammathys](https://github.com/adammathys))
- Fix checkout spec [\#10](https://github.com/solidusio/solidus_auth_devise/pull/10) ([jhawthorn](https://github.com/jhawthorn))
- Minor tweaks and deprecation warning fixes. [\#9](https://github.com/solidusio/solidus_auth_devise/pull/9) ([adammathys](https://github.com/adammathys))

## [v1.1.0](https://github.com/solidusio/solidus_auth_devise/tree/v1.1.0) (2015-06-03)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/v1.0.0...v1.1.0)

**Merged pull requests:**

- Version 1.1.0 [\#8](https://github.com/solidusio/solidus_auth_devise/pull/8) ([jhawthorn](https://github.com/jhawthorn))
- Fixes for latest solidus + add CircleCI [\#7](https://github.com/solidusio/solidus_auth_devise/pull/7) ([jhawthorn](https://github.com/jhawthorn))
- Use git+ssh for solidus gem [\#6](https://github.com/solidusio/solidus_auth_devise/pull/6) ([jhawthorn](https://github.com/jhawthorn))
- Remove dead code. [\#5](https://github.com/solidusio/solidus_auth_devise/pull/5) ([adammathys](https://github.com/adammathys))
- Clean-up frontend registrations and sessions controllers [\#4](https://github.com/solidusio/solidus_auth_devise/pull/4) ([forkata](https://github.com/forkata))
- Minor update to README.md [\#3](https://github.com/solidusio/solidus_auth_devise/pull/3) ([adammathys](https://github.com/adammathys))

## [v1.0.0](https://github.com/solidusio/solidus_auth_devise/tree/v1.0.0) (2015-05-26)

[Full Changelog](https://github.com/solidusio/solidus_auth_devise/compare/8ee9c748ec9bff1d90a61a1192e03fa9999c6dfd...v1.0.0)

**Merged pull requests:**

- Use solidus gem instead of spree [\#2](https://github.com/solidusio/solidus_auth_devise/pull/2) ([jhawthorn](https://github.com/jhawthorn))
- The rename! [\#1](https://github.com/solidusio/solidus_auth_devise/pull/1) ([adammathys](https://github.com/adammathys))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
