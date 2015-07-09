class ShowPongRulesScreen < ProMotion::Screen
  attr_accessor :pong_rules

  def on_load
    self.view.backgroundColor = :white.uicolor
  end
end
