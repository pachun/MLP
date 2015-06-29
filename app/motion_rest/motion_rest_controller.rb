module MotionRest
  class Controller
    include ProMotion::DelegateModule
    include ProMotion::ScreenNavigation

    attr_accessor :__action

    def self.instance
      @instance ||= new
    end

    def self.new
      if @instance.nil?
        super
      else
        @instance.__action = :create
        @instance.new
      end
    end

    def self.edit
      @instance.__action = :update
      @instance.edit
    end

    def self.method_missing(method_name, *args)
      if args
        instance.send(method_name, *args)
      else
        instance.send(method_name)
      end
    end

    def open(*args)
      screen = args[0]
      args << {} if args.count == 1
      options = args[1]
      options[:__action] ||= @__action

      if UIApplication.sharedApplication.keyWindow.nil?
        puts "good"
        open_root_screen(screen, options)
      else
        puts "bad"
        open_screen(screen, options)
      end
    end
  end
end
