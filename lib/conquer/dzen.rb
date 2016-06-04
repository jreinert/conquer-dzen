require 'conquer'
require 'conquer/dzen/version'
require 'conquer/dzen/color'
require 'conquer/dzen/graphics'
require 'conquer/dzen/positioning'

module Conquer
  module Helpers
    extend Dzen::Color
    extend Dzen::Graphics
    extend Dzen::Positioning
  end
end
