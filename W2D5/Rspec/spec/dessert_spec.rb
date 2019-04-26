require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("brownie", 4, "Famous Chef Guy" ) }
  let(:chef) { double("chef") }

  describe "#initialize" do
  
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(4)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_a(Array)
    end

    it "raises an argument error when given a non-integer quantity" do
     
      expect { Dessert.new("brownie", "lots", "Famous Chef Guy") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("pickle")
      expect(dessert.ingredients).to include("pickle")
    end
  end

  describe "#mix!" do
   
    it "shuffles the ingredient array" do
      dessert.add_ingredient("pickle")
      dessert.add_ingredient("jar")
      dessert.add_ingredient("brownie")
      dessert.add_ingredient("chip")
      arr = dessert.ingredients.dup
      dessert.mix!
      expect(dessert.ingredients).to_not eq(arr)
      
    end
  end

  describe "#eat" do
    
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(10) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Famous Chef Guy the Great Baker")
       expect(dessert.serve).to eq("Chef Famous Chef Guy the Great Baker has made 4 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
