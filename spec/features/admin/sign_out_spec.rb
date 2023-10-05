# frozen_string_literal: true

RSpec.feature 'Admin - Sign Out', type: :feature, js: true do
  given!(:user) do
   create :user, email: 'email@person.com'
  end

  background do
    visit spree.admin_login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret'
    # Regression test for #1257
    check 'Remember me'
    click_button 'Login'
  end

  scenario 'allows a signed in user to logout' do
    click_logout_link
    visit spree.admin_login_path
    expect(page).to have_text 'Login'
    expect(page).not_to have_text 'Logout'
  end

  def click_logout_link
    new_version? ? logout_new_version : logout_old_version
  end

  def new_version?
    Gem::Requirement.new('>= 4.2').satisfied_by?(Spree.solidus_gem_version)
  end

  def logout_new_version
    find('details div', text: user.email, wait: 10).click
    within('details') do
      click_link 'Logout'
    end
  end

  def logout_old_version
    click_link 'Logout'
  end
end
