require_relative 'spec_helper'

describe '#output_ingredient' do
  it "puts ingredients of a burger" do

    @burger = Burger.find_by(name:"pollo_loco")

    expect(@burger.output_ingredient).to eq(["lettuce", "tomatoes", "chicken", "szechuan sauce"])

  end
end
