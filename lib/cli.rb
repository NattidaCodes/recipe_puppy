class CLI 
  
  def start 
    puts "Welcome Chef"
    API.fetch_results
    self.recipe_menu
  end
  
  def recipe_menu
    puts "Would you like to choose a recipe?"
    puts "Type 'yes' to select a recipe or 'no' to exit"
    
    user_input = gets.strip
    
    if user_input == "yes"
      puts "What will you make today?"
      display_list_of_recipes
      users_recipe_choice
      
    end
  end
  
  def display_list_of_recipes
    Recipe.all.each.with_index(1) do |recipes, index|
      puts "#{index}. #{recipes.title}"
    end
  end
  
  def users_recipe_choice
    puts "Select your Recipe:"
    index = gets.strip.to_i - 1
    
    until index.between?(0, Recipe.all.length - 1)
      puts "Sorry, please choose a valid number"
      index = gets.strip.to_i - 1
    end
    
    recipe_instance = Recipe.all[index]
    
    display_ingredients
    
  end
  
  def display_ingredients
    
  end
  
end