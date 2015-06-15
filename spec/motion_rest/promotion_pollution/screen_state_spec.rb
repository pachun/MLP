describe "ProMotion" do
  describe "Screens" do
    it "has an @__action instance variable" do
      class MyScreen < PM::Screen; end
      my_screen = MyScreen.new
      lambda do
        my_screen.__action = :create
      end.should.not.raise(StandardError)
    end
  end

  describe "TableScreens" do
    it "has an @__action instance variable" do
      class MyTableScreen < PM::TableScreen;
        def table_data; end
      end
      my_table_screen = MyTableScreen.new
      lambda do
        my_table_screen.__action = :create
      end.should.not.raise(StandardError)
    end
  end
end
