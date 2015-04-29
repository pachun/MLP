class UISwitch < UIControl
  def init
    super.tap do |me|
      me.setOnTintColor(GlobalStyles.gray_tint)
    end
  end
end
