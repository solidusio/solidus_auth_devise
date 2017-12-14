if SolidusSupport.frontend_available? && SolidusSupport.solidus_gem_version < Gem::Version.new('2.5.x')
  Deface::Override.new(
    virtual_path: "spree/shared/_nav_bar",
    name: "auth_shared_login_bar",
    insert_before: "li#search-bar",
    partial: "spree/shared/login_bar_items",
    disabled: false,
    original: 'eb3fa668cd98b6a1c75c36420ef1b238a1fc55ac'
  )
end
