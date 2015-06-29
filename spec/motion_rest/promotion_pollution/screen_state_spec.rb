describe "ProMotion Pollution" do
  it "adds an @__action instance variable to screens" do
    class MyScreen < PM::Screen; end
    my_screen = MyScreen.new
    lambda do
      my_screen.__action = :create
    end.should.not.raise(StandardError)
  end

  it "adds an @__action instance variable to table screens" do
    class MyTableScreen < PM::TableScreen;
      def table_data; end # required for instantiation
    end
    my_table_screen = MyTableScreen.new
    lambda do
      my_table_screen.__action = :create
    end.should.not.raise(StandardError)
  end

  it "adds a :save method which calls whatever is in @__action" do
    NewValue = 5
    class MyScreen < ProMotion::Screen
      attr_accessor :some_screen_variable

      def set_var_to_new_value
        @some_screen_variable = NewValue
      end
    end
    my_screen = MyScreen.new
    my_screen.some_screen_variable = 0
    my_screen.__action = :set_var_to_new_value
    my_screen.save
    expect(my_screen.some_screen_variable).to eq(NewValue)
  end
end
