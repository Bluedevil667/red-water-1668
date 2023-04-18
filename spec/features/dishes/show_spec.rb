require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before :each do
    @chef_1 = Chef.create!(name: "Chef 1")
    @dish_1 = @chef_1.dishes.create!(name: "Dish 1", description: "Description 1")
    @ingredient_1 = Ingredient.create!(name: "Ingredient 1", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "Ingredient 2", calories: 200)
    @ingredient_3 = Ingredient.create!(name: "Ingredient 3", calories: 300)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
  end

  it "displays the dish's name and description" do
    visit dish_path(@dish_1)

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
  end

  it "displays a list of ingredients for that dish" do
    visit dish_path(@dish_1)

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
  end

  it "displays the chef's name" do
    visit dish_path(@dish_1)
    
    expect(page).to have_content(@chef_1.name)
  end

  it "displays the total calorie count for that dish" do
    visit dish_path(@dish_1)

    expect(page).to have_content(@dish_1.total_calories)
  end
end