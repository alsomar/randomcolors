# Please see the loader file for information on the license and author info.
module ASM_Extensions
  module RandomColors
    require FILE_DATA
  end # module RandomColors

  if !defined?(@asm_tools_menu_loaded)
    @asm_tools_menu = UI.menu("Extensions").add_submenu("ASM Tools")
    @asm_tools_menu_loaded = true
  end

  if !defined?(@randomcolors_loaded)
    @asm_tools_menu.add_item(RandomColors::PLUGIN_NAME) { RandomColors.apply_randomcolors }
    @randomcolors_loaded = true
  end # module RandomColors
end # module ASM_Extensions
