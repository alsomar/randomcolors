module ASM_Extensions
  module RandomColors

    # Define a method to generate an array of random colors
    def self.generate_randomcolors(num_colors)
      colors = []
      num_colors.times do
        r = rand(256)
        g = rand(256)
        b = rand(256)
        color = Sketchup::Color.new(r, g, b)
        colors.push(color)
      end
      # Return the array of random colors
      return colors
    end

    # Define a method to apply random colors to selected entities
    def self.apply_randomcolors
      # Get the SketchUp model and the selected entities
      model = Sketchup.active_model
      entities = model.selection

      # If no entities are selected, show a message and return
      if entities.empty?
        UI.messagebox("Please select some faces, groups or components.")
        return
      end

      # Ask the user how many colors they want in the palette
      num_colors = UI.inputbox(["How many colors in the palette?"], [8], ["Enter a number"])[0]

      # Convert the user input to an integer and ensure it is greater than zero
      num_colors = num_colors.to_i
      num_colors = num_colors > 0 ? num_colors : 1

      # Start an operation to group the changes made by the script
      model.start_operation("Random Colors", true)

      # Generate an array of random colors
      colors = generate_randomcolors(num_colors)

      # Iterate over the selected entities
      entities.each do |entity|
        # Select a random color from the array of colors
        color = colors.sample
        # Set the entity's material to the random color
        entity.material = color
      end

      # Commit the operation to make the changes undoable
      model.commit_operation
    end
  end # module RandomColors
end # module ASM_Extensions
