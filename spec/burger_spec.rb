describe '#output_ingredient' do
  it "puts ingredient of a burger" do

    @burger = Burger.find_by(name:"cacrv")
    expect(@burger.output_ingredient).to eq(["Onio","Onion", "Onion", "Onion"])
  end
end
