class EditPongRulesScreen < PM::FormScreen
  attr_accessor :pong_rules

  def on_load
    puts "HELLO WORLD"
    puts "pong rules are: #{@pong_rules}"
    puts "action is: #{@__action}"
  end

  def save_rules
    @pong_rules.label = render_form[:label]
    @pong_rules.balls_back = render_form[:balls_back].boolValue
    persist_rerack_conditions
    puts "@__action is: #{@__action}"
    # save
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
        cells: [{
            title: "Label",
            name: :label,
            type: :text,
            placeholder: "e.g. house rules",
          }, {
            title: "Balls back?",
            name: "balls_back",
            type: :boolean,
          }
        ],
      }, {
        title: "always rerack",
        cells: [{
            title: "when 8 cups remain",
            name: :rerack_when_8_cups_remain,
            type: :boolean,
          }, {
            title: "when 7 cups remain",
            name: :rerack_when_7_cups_remain,
            type: :boolean,
          }, {
            title: "when 6 cups remain",
            name: :rerack_when_6_cups_remain,
            type: :boolean,
          }, {
            title: "when 5 cups remain",
            name: :rerack_when_5_cups_remain,
            type: :boolean,
          }, {
            title: "when 4 cups remain",
            name: :rerack_when_4_cups_remain,
            type: :boolean,
          }, {
            title: "when 3 cups remain",
            name: :rerack_when_3_cups_remain,
            type: :boolean,
          }, {
            title: "when 2 cups remain",
            name: :rerack_when_2_cups_remain,
            type: :boolean,
          },
        ],
      }, {
        title: "",
        cells: [
          {
            title: "Save",
            type: :button,
            action: :save_rules,
          },
        ]
      },
    ]
  end
end
