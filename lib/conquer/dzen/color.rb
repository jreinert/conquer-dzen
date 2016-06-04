module Conquer
  module Dzen
    module Color
      def fg(color, &block)
        change_color(:fg, color, &block)
      end

      def bg(color, &block)
        change_color(:bg, color, &block)
      end

      private

      def change_color(type, color)
        if block_given?
          "^#{type}(#{color})#{yield}^#{type}()"
        else
          "^#{type}(#{color})"
        end
      end
    end
  end
end
