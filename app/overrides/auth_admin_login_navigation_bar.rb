if SolidusSupport.solidus_gem_version < Gem::Version.new('1.2')
  Deface::Override.new(
    virtual_path: "spree/admin/shared/_header",
    name: "auth_admin_login_navigation_bar",
    insert_before: "[data-hook='admin_login_navigation_bar'], #admin_login_navigation_bar[data-hook]",
    partial: "spree/layouts/admin/login_nav",
    disabled: false,
    original: '841227d0aedf7909d62237d8778df99100087715'
  )
end
