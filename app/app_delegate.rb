class AppDelegate < PM::Delegate
  def on_load(*)
    open PM::Screen.new(nav_bar: true)
  end
end
