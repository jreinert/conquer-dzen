module Conquer
  module Dzen
    module Positioning
      def ignore_bg(state = :on)
        if block_given?
          "^ib(1)#{yield}^ib(0)"
        else
          "^ib(#{state == :on ? 0 : 1})"
        end
      end

      def lock_x(options = {})
        if block_given?
          "#{'^ib(1)' if options[:ignore_bg]}" \
          "#{lock_x}#{yield}#{unlock_x}" \
          "#{'^ib(0)' if options[:ignore_bg]}"
        else
          "#{'^ib(1)' if options[:ignore_bg]}^p(_LOCK_X)"
        end
      end

      def unlock_x
        '^p(_UNLOCK_X)'
      end

      def shift(x, y = 0)
        return "#{shift(x, y)}#{yield}#{shift(-x)}^p()" if block_given?
        x = x.round
        y = y.round
        x = nil if x == 0
        y = nil if y == 0
        return unless x || y
        "^p(#{x};#{y})"
      end
    end
  end
end
