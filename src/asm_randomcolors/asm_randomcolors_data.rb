module ASM_Extensions
  module RandomColors

    # Define a method to generate an array of random colors
    def self.generate_randomcolors(num_colors)
      Array.new(num_colors) { Sketchup::Color.new(rand(256), rand(256), rand(256)) }
    end

    # Define a method to apply random colors to selected entities
    def self.apply_randomcolors
      model = Sketchup.active_model
      selection = model.selection

      if selection.empty?
        UI.messagebox("Please select some faces, groups, or components.")
        return
      end

      num_colors = UI.inputbox(["How many colors in the palette? "], [8], "Random Colors")[0].to_i
      num_colors = [num_colors, 1].max

      model.start_operation("Random Colors", true)

      colors = generate_randomcolors(num_colors)
      selection.each { |entity| entity.material = colors.sample }

      model.commit_operation
    end
  end # module RandomColors
end # module ASM_Extensions
