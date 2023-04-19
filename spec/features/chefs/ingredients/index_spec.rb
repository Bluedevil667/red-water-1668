require 'rails_helper'

RSpec.describe 'Chef Ingredients Index Page' do
  before :each do
    @chef_1 = Chef.create!(name: "Chef 1")
    @dish_1 = @chef_1.dishes.create!(name: "Dish 1", description: "Description 1")
    @ingredient_1 = Ingredient.create!(name: "Ingredient 1", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "Ingredient 2", calories: 200)
    @ingredient_3 = Ingredient.create!(name: "Ingredient 3", calories: 300)
    @ingredient_4 = Ingredient.create!(name: "Ingredient 4", calories: 400)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
  end

  describe 'as a visitor' do
    it 'displays a unique list of names of all ingredients that this chef uses' do
      visit chef_ingredients_path(@chef_1)

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to_not have_content(@ingredient_4.name)
    end
  end
end