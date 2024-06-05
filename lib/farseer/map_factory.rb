module Farseer
  module MapFactory
    def map(&)
      Map.new(self, &)
    end
  end
end
