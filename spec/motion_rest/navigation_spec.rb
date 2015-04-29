describe Navigation do
  it "defaults .using_nav_bar? to true" do
    expect(Navigation.using_nav_bar?).to eq(true)
  end

  it "sets using_nav_bar state with .using_nav_bar=(using_nav_bar)" do
    Navigation.using_nav_bar = false
    expect(Navigation.using_nav_bar?).to eq(false)

    Navigation.using_nav_bar = true
    expect(Navigation.using_nav_bar?).to eq(true)
  end
end
