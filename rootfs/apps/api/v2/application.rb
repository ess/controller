require 'json'
require_relative 'deck'

module API
  module V2
    Application = Syro.new(Deck) do
      on(authenticated) do
        root do
          get do
            res.json({})
          end
        end
      end
    end
  end
end
