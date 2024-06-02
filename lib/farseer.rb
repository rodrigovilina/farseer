# frozen_string_literal: true

require 'zeitwerk'
loader = Zeitwerk::Loader::for_gem
loader.setup

module Farseer
end

loader.eager_load
