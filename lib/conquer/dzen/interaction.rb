require 'conquer/dzen/interaction/callback_listener'
require 'conquer/dzen/interaction/tooltip_listener'

module Conquer
  module Dzen
    module Interaction
      def show_tooltip(*args)
        Celluloid.publish('tooltip', *args)
      end

      def button(button, callback, *args)
        rpc_call = { method: :event, params: ['button', callback, *args] }
        command = "echo -n '#{rpc_call.to_json}' | socat stdin '#{RPC_SOCKET}'"
        "^ca(#{button}, #{command})#{yield}^ca()"
      end

      Conquer.on_startup do
        CallbackListener.supervise
        TooltipListener.supervise
      end
    end
  end
end
