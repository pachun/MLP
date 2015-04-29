module MotionRest
  module ApplicationControllers
    def retain_controller_singletons
      @__controllers = controllers.map(&:instance)
    end
  end
end
