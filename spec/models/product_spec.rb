require "rails_helper"

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'should be valid if all information are included' do
      cat1 = Category.new(name: 'A')
      @product = cat1.products.new(name: "name", price: 10, quantity: 10,)
      expect(@product).to be_valid
    end
    
    it 'should have a name' do
      cat1 = Category.new(name: 'A')
      @product = cat1.products.new(name: nil, price: 10, quantity: 10,)
      expect(@product).to_not be_valid
    end

    it 'should have price' do
      cat1 = Category.new(name: 'A')
      @product = cat1.products.new(name: "name", price: nil, quantity: 10,)
      expect(@product).to_not be_valid
    end

    it 'should have quantity' do
      cat1 = Category.new(name: 'A')
      @product = cat1.products.new(name: "name", price: 10, quantity: nil,)
      expect(@product).to_not be_valid
    end

    it 'should have category' do
      @product = Product.new(name: "name", price: 10, quantity: 10,)
      expect(@product).to_not be_valid
    end
  end
end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true