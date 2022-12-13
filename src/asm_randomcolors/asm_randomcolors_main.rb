module ASM_Extensions
  module RandomColors
    require FILE_DATA
  end # module RandomColors

  if !file_loaded?('asm_menu_loader')
    @@asm_tools_menu = UI.menu("Extensions").add_submenu("ASM Tools")
  end

  if !file_loaded?(__FILE__)
    @@asm_tools_menu.add_item(RandomColors::PLUGIN_NAME) { RandomColors.appy_random_colors }
  end

  file_loaded('asm_menu_loader')
  file_loaded(__FILE__)
end # module ASM_Extensions
