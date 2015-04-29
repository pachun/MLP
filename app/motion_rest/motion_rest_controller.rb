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
  end
end
