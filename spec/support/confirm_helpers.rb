module ConfirmHelpers
  def set_confirmable_option(value)
    if value
      Spree::User.devise_modules.push(:confirmable)
      Spree::Auth::Config.set(confirmable: true)
    else
      Spree::User.devise_modules.delete(:confirmable)
      Spree::Auth::Config.set(confirmable: false)
    end
  end
end

RSpec.configure do |c|
  c.include ConfirmHelpers
end
