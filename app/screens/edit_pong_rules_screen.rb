class EditPongRulesScreen < PM::FormScreen
  attr_accessor :pong_rules, :action

  def save_rules
    @pong_rules.label = render_form[:label]
    @pong_rules.balls_back = render_form[:balls_back].boolValue
    persist_rerack_conditions
    PongRulesController.create
  end

  def persist_rerack_conditions
    @pong_rules.rerack_when_8_cups_remain = render_form[:rerack_when_8_cups_remain].boolValue
    @pong_rules.rerack_when_7_cups_remain = render_form[:rerack_when_7_cups_remain].boolValue
    @pong_rules.rerack_when_6_cups_remain = render_form[:rerack_when_6_cups_remain].boolValue
    @pong_rules.rerack_when_5_cups_remain = render_form[:rerack_when_5_cups_remain].boolValue
    @pong_rules.rerack_when_4_cups_remain = render_form[:rerack_when_4_cups_remain].boolValue
    @pong_rules.rerack_when_3_cups_remain = render_form[:rerack_when_3_cups_remain].boolValue
    @pong_rules.rerack_when_2_cups_remain = render_form[:rerack_when_2_cups_remain].boolValue
  end

  def form_data
    [
      {
        cells: [
          {
            title: I18n.t("pong_rules.rules_label"),
            name: :label,
            type: :text,
            placeholder: I18n.t("pong_rules.example_rules_label"),
          }, {
            title: I18n.t("pong_rules.balls_back_question"),
            name: :balls_back,
            type: :boolean,
          }
        ],
      }, {
        title: "always rerack",
        cells: [
          {
            title: I18n.t("pong_rules.when_x_cups_remain", num_cups: 8),
            name: :rerack_when_8_cups_remain,
            type: :boolean,
          }, {
            title: I18n.t("pong_rules.when_x_cups_remain", num_cups: 7),
            name: :rerack_when_7_cups_remain,
            type: :boolean,
          }, {
            title: I18n.t("pong_rules.when_x_cups_remain", num_cups: 6),
            name: :rerack_when_6_cups_remain,
            type: :boolean,
          }, {
            title: I18n.t("pong_rules.when_x_cups_remain", num_cups: 5),
            name: :rerack_when_5_cups_remain,
            type: :boolean,
          }, {
            title: I18n.t("pong_rules.when_x_cups_remain", num_cups: 4),
            name: :rerack_when_4_cups_remain,
            type: :boolean,
          }, {
            title: I18n.t("pong_rules.when_x_cups_remain", num_cups: 3),
            name: :rerack_when_3_cups_remain,
            type: :boolean,
          }, {
            title: I18n.t("pong_rules.when_x_cups_remain", num_cups: 2),
            name: :rerack_when_2_cups_remain,
            type: :boolean,
          },
        ],
      }, {
        title: "",
        cells: [
          {
            title: I18n.t("pong_rules.save_button"),
            type: :button,
            action: :save_rules,
          },
        ]
      },
    ]
  end

  def render_errors
    show_in_popup(@pong_rules.errors.first)
  end

  private

  def show_in_popup(text)
    mp @pong_rules.errors
    alert = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    alert.mode = MBProgressHUDModeText
    alert.labelText = text
    queue = Dispatch::Queue.main
    queue.after(1.0) do
      MBProgressHUD.hideHUDForView(self.view, animated: true)
    end
  end
end
