class PongRulesController < MotionRest::Controller
  def all
  end

  def new
    @pong_rules = PongRules.new

    open EditPongRulesScreen.new(
      nav_bar: Navigation.using_nav_bar?,
      pong_rules: @pong_rules,
      action: :create,
      title: I18n.t("pong_rules.new_title")
    )
  end

  def create
    if @pong_rules.save
      mp @pong_rules
    else
      screen.render_errors
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
