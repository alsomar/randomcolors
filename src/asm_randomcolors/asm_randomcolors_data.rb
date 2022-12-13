module ASM_Extensions
  module RandomColors

    # Define a method to generate a random color
    def self.generate_random_colors
      # Generate a random color
      r = rand(256)
      g = rand(256)
      b = rand(256)
      color = Sketchup::Color.new(r, g, b)
      # Return the random color
      return color
    end

    # Define a method to apply random colors to selected entities
    def self.apply_random_colors
      # Get the SketchUp model and the selected entities
      model = Sketchup.active_model
      entities = model.selection

      # If no entities are selected, show a message and return
      if entities.empty?
        UI.messagebox("Please select some faces, groups or components.")
        return
      end

      # Start an operation to group the changes made by the script
      model.start_operation("Random Colors", true)

      # Iterate over the selected entities
      entities.each do |entity|
            # Generate a random color
        color = generate_random_colors
        # Set the entity's material to the random color
        entity.material = color
      end

      # Commit the operation to make the changes undoable
      model.commit_operation
    end
  end # module RandomColors
end # module ASM_Extensions
