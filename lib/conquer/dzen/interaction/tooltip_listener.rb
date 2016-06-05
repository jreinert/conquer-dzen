require 'celluloid/current'

module Conquer
  module Dzen
    module Interaction
      class TooltipListener
        include Celluloid
        include Celluloid::Notifications

        def initialize
          @current_tooltip = nil
          subscribe('tooltip', :show_tooltip)
        end

        def show_tooltip(_, title, text, width = 150)
          Process.kill('TERM', @current_tooltip) if @current_tooltip

          lines = text.lines.size
          mouse = `xdotool getmouselocation`.match(
            /^x:(?<x>\d+) y:(?<y>\d+) screen:(?<screen>\d+)/
          )
          dzen_command = [
            'dzen2', '-x', mouse[:x], '-y', mouse[:y], '-l', lines.to_s,
            '-w', width.to_s, '-e', 'onstart=uncollapse;button1=exit',
            '-xs', mouse[:screen]
          ]
          pipe = ::IO.popen(dzen_command, 'w+')
          @current_tooltip = pipe.pid

          pipe.puts title
          pipe.puts text
          pipe.flush
          pipe.pid
        end
      end
    end
  end
end
