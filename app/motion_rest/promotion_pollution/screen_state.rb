module ProMotion
  module ScreenModule
    attr_accessor :__action

    def save
      send(@__action.to_sym)
    end
  end
end
