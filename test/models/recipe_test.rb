require 'test_helper'
#Don't forget to name correctly the class test: RecipeTest, it wont't work if just name it as Recipe
class RecipeTest < ActiveSupport::TestCase
  #method
  def setup
    #local variable: recipe
    #instance variable: @recipe it will be available for the rest of the model, so this is a recipe object
    #@recipe = Recipe.new(name: "Chicken parm", summary: "This is the best chicken parm recipe ever",
    #description: "heat oil, add onions, add tomatoes sauce, add chicken, 
    #cook for 20 minutes")
    @chef = Chef.create(chefname: "ian", email: "ian@example.com")
    @recipe = @chef.recipes.new(name: "Chicken parm", summary: "This is the best chicken parm recipe ever",
    description: "heat oil, add onions, add tomatoes sauce, add chicken, 
    cook for 20 minutes")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?  
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end 
  
  test "name must be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end 
  
  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end 
  
  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end 
  
  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end 
  
   test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description length should not be too long" do
     @recipe.description = "a" * 501
     assert_not @recipe.valid?
  end 
  
  test "description length should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end 
end