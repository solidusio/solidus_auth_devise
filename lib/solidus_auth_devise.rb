require "spree_core"
require "solidus_support"
require "spree/auth/devise"
require "spree/authentication_helpers"

if SolidusSupport.solidus_gem_version < Gem::Version.new('2.5.x')
  begin
    require "deface"
  rescue LoadError
    warn "deface is required to run solidus_auth_devise with solidus versions < 2.5. Please add deface to your Gemfile"
    raise
  end
end
