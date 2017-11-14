require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is saveable" do
      @category = Category.create(name: 'Stuff')
      @product = @category.products.create({
        name:  'Red Bookshelf',
        description: 'awesome thing',
        image: 'bookshelf.jpg',
        quantity: 23,
        price: 2_483.75
      })
      expect(@product).to be_a Product
    end

    it "has a valid name" do
      @category = Category.create(name: 'Stuff')
      @product = @category.products.create({
        name: nil,
        description: 'awesome thing',
        image: 'bookshelf.jpg',
        quantity: 23,
        price: 2_483.75
      })
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "has a valid price" do
      @category = Category.create(name: 'Stuff')
      @product = @category.products.create({
        name:  'Red Bookshelf',
        description: 'awesome thing',
        image: 'bookshelf.jpg',
        quantity: 23,
        price: nil
      })
      expect(@product.errors[:price]).to include("can't be blank")
    end

    it "has a valid quantity" do
      @category = Category.create(name: 'Stuff')
      @product = @category.products.create({
        name:  'Red Bookshelf',
        description: 'awesome thing',
        image: 'bookshelf.jpg',
        quantity: nil,
        price: 2_483.75
      })
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "has a valid category" do
      # @category = Category.create(name: 'Stuff')
      @product = Product.create({
        name:  'Red Bookshelf',
        description: 'awesome thing',
        image: 'bookshelf.jpg',
        quantity: 23,
        price: 2_483.75
      })
      expect(@product.errors[:category]).to include("can't be blank")
    end

    it "has a password with length >= 6" do
      # @category = Category.create(name: 'Stuff')
      @product = Product.create({
        name:  'Red Bookshelf',
        description: 'awesome thing',
        image: 'bookshelf.jpg',
        quantity: 23,
        price: 2_483.75
      })
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end
