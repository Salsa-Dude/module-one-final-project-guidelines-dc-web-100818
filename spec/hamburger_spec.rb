require_relative 'spec_helper'

describe Burger do

  # after(:each) do
  #   .destroy_all
  # end

  before(:each) do
    @joseph = Burger.create(:name => "joseph")
    @nathan = Burger.create(:name => "nathan")
    @lettuce = Ingredient.create(:name => "Lettuce", :price => 0.25)
    @meat = Ingredient.create(:name => "Meat", :price => 2.25)
    @cheese = Ingredient.create(:name => "Cheese", :price => 1.00)
    @order1 = BurgerIngredient.create(:burger => @joseph, :ingredient => @lettuce)
  end

  describe "attributes" do
    it "has data attributes given to it from a migration file" do
    #TODO: You'll need to create a new migration to add
    #the necessary columns to the shows table
      expect(@joseph.name).to eq("joseph")
      expect(@nathan.name).to eq("nathan")
      expect(@lettuce.name).to eq("Lettuce")
      expect(@meat.name).to eq("Meat")
      expect(@order1.burger).to eq(@joseph)
    end
  end

  it "has a price" do
    meat = Ingredient.create(:name => "Meat", :price => 2.25)
    expect(meat.price).to eq(2.25)
  end

  it "has a price" do
    cheese = Ingredient.create(:name => "Cheese", :price => 1.00)
    expect(cheese.price).to eq(1.00)
  end

  it "BurgerIngredient has a burger" do
    order1 = BurgerIngredient.create(:burger => @joseph, :ingredient => @lettuce)
    expect(order1.burger).to eq(@joseph)
  end

  it "BurgerIngredient has a ingredient" do
    order1 = BurgerIngredient.create(:burger => @joseph, :ingredient => @lettuce)
    expect(order1.ingredient).to eq(@lettuce)
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> new_dev
