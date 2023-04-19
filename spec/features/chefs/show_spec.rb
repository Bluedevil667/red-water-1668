require 'rails_helper'

RSpec.describe 'Chef Show Page' do
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
    it 'displays the name of the chef' do
      visit chef_path(@chef_1)

      expect(page).to have_content(@chef_1.name)
    end

    it 'displays a link to view a list of all ingredients that this chef uses in their dishes' do
      visit chef_path(@chef_1)

      expect(page).to have_link("View All Ingredients")
      click_link "View All Ingredients"
      expect(current_path).to eq(chef_ingredients_path(@chef_1))
    end
  end
end