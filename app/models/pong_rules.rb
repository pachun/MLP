class PongRules < CDQManagedObject
  attr_reader :errors

  def save
    if valid?
      cdq.save
    else
      false
    end
  end

  private

  def valid?
    @errors = []
    validate_presence_of_label
  end

  def validate_presence_of_label
    if label.empty?
      @errors << I18n.t("pong_rules.errors.label_required")
      false
    else
      true
    end
  end
end
