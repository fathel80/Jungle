require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid with a new product' do 
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: 'Test1',
        price: 120.00,
        quantity: 5,
        category_id: @category.id,
      )
      expect(@product).to be_valid
    end
      
    it 'should return an error if name is nil' do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: nil,
        price: 120.00,
        quantity: 5,
        category_id: @category.id,
      )
      expect(@product).to_not be_valid
    end
    
    it 'should not save if price is nil' do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: 'Test1',
        category_id: @category.id,
        quantity: 5,
        price: nil,
      )
      expect(@product).to_not be_valid
      
    end

    it 'should return an error if quantity is nil' do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: 'Test1',
        price: 120.00,
        quantity: nil,
        category_id: @category.id,
      )
      expect(@product).to_not be_valid


    end

    it 'should return an error if category is nil' do 
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: 'Test1',
        price: 120.00,
        quantity: 5,
        category_id: nil,
      )
      expect(@product).to_not be_valid
    end

  end
end