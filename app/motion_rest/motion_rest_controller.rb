module MotionRest
  class Controller
    def self.instance
      @instance ||= new
    end

    def self.new
      if @instance.nil?
        super
      else
        instance.new
      end
    end

    def self.method_missing(method_name, *args)
      if args
        instance.send(method_name, *args)
      else
        instance.send(method_name)
      end
    end

    private

    def open(screen, args = {})
      if !application_window?
        open_root_screen(screen, args)
      elsif in_navigation_controller?
        open_screen_in_navigation_controller(screen, args)
      else
        open_screen_modally(screen, args)
      end
    end

    def application_window?
      !UIApplication.sharedApplication.windows.empty?
    end

    def open_root_screen(screen, args)
      UIApplication.sharedApplication.delegate.open(screen, args)
    end

    def in_navigation_controller?
      root_view_controller.is_a?(ProMotion::NavigationController)
    end

    def open_screen_in_navigation_controller(screen, args)
      root_view_controller.viewControllers.last.open_screen(screen, args)
    end

    def open_screen_modally(screen, args)
      root_view_controller.open_screen(screen, args)
    end

    def root_view_controller
      UIApplication.sharedApplication.windows.first.rootViewController
    end

    def screen
      if in_navigation_controller?
        root_view_controller.viewControllers.last
      else
        root_view_controller
      end
    end
  end
end
