require 'celluloid/current'
require 'conquer/dzen/positioning'

module Conquer
  module Dzen
    module Interaction
      class TooltipListener
        MARGIN = 5

        include Celluloid
        include Celluloid::Notifications
        include Positioning

        def initialize
          @current_tooltip = nil
          subscribe('tooltip', :show_tooltip)
        end

        def show_tooltip(_, title, text, width = 150)
          Process.kill('TERM', @current_tooltip.pid) if @current_tooltip
          lines = text.lines.map { |line| shift(MARGIN) { line } }
          mouse = mouse_location
          dzen_command = dzen_command(mouse, lines.size, width + 2 * MARGIN)
          async.run_dzen(dzen_command, title, lines.join)
        end

        private

        def dzen_command(mouse, line_count, width)
          [
            'dzen2', '-x', mouse[:x], '-y', mouse[:y], '-l', line_count.to_s,
            '-w', width.to_s, '-e', 'onstart=uncollapse;button1=exit',
            '-xs', mouse[:screen]
          ]
        end

        def run_dzen(dzen_command, title, text)
          ::IO.popen(dzen_command, 'w+') do |pipe|
            @current_tooltip = pipe
            pipe.puts title
            pipe.puts text
            pipe.flush
            loop { sleep(100) }
          end
        end

        def mouse_location
          `xdotool getmouselocation`.match(
            /^x:(?<x>\d+) y:(?<y>\d+) screen:(?<screen>\d+)/
          )
        end
      end
    end
  end
end
