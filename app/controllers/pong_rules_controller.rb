class PongRulesController < MotionRest::Controller
  def all
  end

  def new
    @pong_rules = PongRules.new

    open EditPongRulesScreen.new(
      nav_bar: Navigation.using_nav_bar?,
      pong_rules: @pong_rules,
      action: :review,
      title: I18n.t("pong_rules.new_title"),
    )
  end

  def show(pong_rules)
    pong_rules

    open ShowPongRulesScreen.new(
      nav_bar: Navigation.using_nav_bar?,
      pong_rules: pong_rules,
      title: pong_rules.label,
    )
  end

  def edit
  end

  def update
  end

  def delete
  end

  def review
    if @pong_rules.valid?
      show(@pong_rules)
    else
      screen.render_errors
    end
  end
end
