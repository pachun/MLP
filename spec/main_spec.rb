describe "Application 'mlp'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window and one (new in iOS 8) overlayed window for specs" do
    @app.windows.size.should == 2
    @app.windows.map(&:class).should.include(UIWindow)
    @app.windows.map(&:class).should.include(UITextEffectsWindow)
  end
end
