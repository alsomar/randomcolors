# Define a method to generate a random color
def generate_random_colors
  # Generate a random color
  r = rand(256)
  g = rand(256)
  b = rand(256)
  color = Sketchup::Color.new(r, g, b)

  # Return the random color
  return color
end

# Define a method to apply random colors to selected entities
def apply_random_colors
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

# Add a menu item for the "Random Colors" feature
unless defined?(@loaded)
  # Get a reference to the Extensions menu.
  extensions_menu = UI.menu("Extensions")

  # Add a new menu item for your extension to the Extensions menu.
  extensions_menu.add_item("Random Colors") do
    # When the menu item is clicked, execute the command.
    self.apply_random_colors()
  end

  # Set the @loaded variable to indicate that the menu item has been added
  @loaded = true
end
