require 'celluloid/current'

module Conquer
  module Dzen
    module Interaction
      class CallbackListener
        include Celluloid
        include Celluloid::Notifications

        def initialize
          subscribe('button', :run_callback)
        end

        def run_callback(_, callback, *args)
          Celluloid::Future.new do
            Helpers.send(callback, *args)
          end
        end
      end
    end
  end
end
