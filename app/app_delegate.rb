class AppDelegate < PM::Delegate
  include MotionRest::ApplicationControllers
  include CDQ

  def on_load(*)
    cdq.setup
    retain_controller_singletons
    return true if RUBYMOTION_ENV == "test"

    PongRulesController.new
  end
end
