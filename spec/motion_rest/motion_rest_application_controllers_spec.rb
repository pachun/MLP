describe MotionRest::ApplicationControllers do

  it ".retain_controller_singletons saves the singletons on an instance var" do
    BaconContext = self

    class SomeController < MotionRest::Controller; end
    class AnotherController < MotionRest::Controller; end

    module MotionRest::ApplicationControllers
      def controllers
        [
          SomeController,
          AnotherController,
        ]
      end
    end

    class MyClass
      include MotionRest::ApplicationControllers

      def initialize
        retain_controller_singletons

        BaconContext.expect(@__controllers.length).to BaconContext.eq(2)

        classes = @__controllers.map(&:class)
        BaconContext.expect(classes).to BaconContext.include(SomeController)
        BaconContext.expect(classes).to BaconContext.include(AnotherController)
      end
    end

    MyClass.new
  end
end
