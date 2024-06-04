# frozen_string_literal: true

require 'muina'
require 'zeitwerk'
loader = Zeitwerk::Loader::for_gem
loader.setup

module Farseer
  Maybe = Muina::Maybe
end

loader.eager_load
