describe '#output_ingredient' do
  it "puts ingredient of a burger" do

    @burger = Burger.find_by(name:"pollo_loco")

    expect(@burger.output_ingredient).to eq(["lettuce, tomatoes, chicken, Szechuan sauce"])

  end
end
