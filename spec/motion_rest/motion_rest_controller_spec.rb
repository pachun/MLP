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
end
