require 'extensions' unless defined?(SketchupExtension)

module ASM
  module RandomColors

    # Constants
    plugin_name = 'Random Colors'
    plugin_version = '0.0.1'
    plugin_description = 'Apply random colors to the selected faces, groups or components.'
    plugin_id = File.basename(__FILE__, '.rb')

    # Paths
    path_root = File.dirname(__FILE__)
    path_main = File.join(path_root, plugin_id, 'main.rb')

    # Create a new instance of the SketchupExtension class
    ext_data = SketchupExtension.new(plugin_name, path_main)

    # Attach some nice info
    ext_data.version = plugin_version
    ext_data.description = plugin_description
    ext_data.creator = "Alejandro Soriano"
    ext_data.copyright = "2021-#{Time.now.year}, #{ext_data.creator}"

    # Register and load the extension on first install
    Sketchup.register_extension(ext_data, true)

  end # module RandomColors
end # module ASM
#just a little change
