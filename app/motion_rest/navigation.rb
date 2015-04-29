class Navigation
  @@using_nav_bar = true

  def self.using_nav_bar?
    @@using_nav_bar
  end

  def self.using_nav_bar=(using_nav_bar)
    @@using_nav_bar = using_nav_bar
  end
end
