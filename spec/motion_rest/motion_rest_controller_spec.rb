describe "a subclass of MotionRest::Controller" do
  before do
    class MyController < MotionRest::Controller
      attr_accessor :counter
    end
    MyController.counter = 0
  end

  it "has a singleton instance" do
    singleton = MyController.instance
    expect(singleton).to eq(MyController.instance)
  end

  it "forwards .new (class method) to the singleton once it's instantiated" do
    class MyController < MotionRest::Controller
      def new
        @counter = 500
      end
    end
    MyController.new
    expect(MyController.counter).to eq(500)
  end

  it "forwards class messages without args to the singleton instance" do
    class MyController < MotionRest::Controller
      def inc
        @counter += 1
      end
    end
    MyController.inc
    expect(MyController.instance.counter).to eq(1)
  end

  it "forwards class messages with args to the singleton instance" do
    class MyController < MotionRest::Controller
      def add(num)
        @counter += num
      end
    end
    add_amount = 10
    MyController.add(add_amount)
    expect(MyController.instance.counter).to eq(add_amount)
  end

  it "includes the ProMotion::ScreenNavigation mixin (to override :open)" do
    included_modules = MyController.included_modules
    expect(included_modules).to include(ProMotion::ScreenNavigation)
  end

  it "has an @__action instance variable" do
    lambda do
      MyController.__action
    end.should.not.raise(StandardError)
  end

  describe "MotionRest::Controller's @__action instance variable" do
    before do
      class MyController < MotionRest::Controller
        def new; end
        def edit; end
      end
      MyController.__action = :something
    end

    it "is set to :create when :new is called" do
      MyController.new
      expect(MyController.__action).to eq(:create)
    end

    it "is set to :update when :edit is called" do
      MyController.edit
      expect(MyController.__action).to eq(:update)
    end
  end

  # This test alters global testing state by overriding
  # ProMotion::ScreenNavigation.open_screen()
  # which causes other tests to fail that otherwise wouldn't
  #
  # it "overrides open(screen, options) to add {__action: @__action} to options
  #     and forward the call to open_screen(screen, options)" do
  #   TestContext = self
  #
  #   # this is a stub
  #   module ProMotion::ScreenNavigation
  #     def open_screen(screen, options)
  #       TestContext.expect(options).to TestContext.have_key(:__action)
  #       TestContext.expect(options[:__action]).to TestContext.eq(MyAction)
  #       TestContext.expect(screen).to TestContext.eq(MyScreen)
  #     end
  #   end
  #
  #   class SomeScreen < PM::Screen; end
  #
  #   MyAction = :my_action
  #   MyScreen = SomeScreen.new
  #
  #   class MyController < MotionRest::Controller
  #     def go
  #       @__action = MyAction
  #       open MyScreen
  #     end
  #   end
  #
  #   MyController.go
  # end
end
