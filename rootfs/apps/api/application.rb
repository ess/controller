require 'syro'
require_relative 'deck'
require_relative 'v2/application'

module API
  Application = Syro.new(Deck) do
    on 'v2' do
      run(V2::Application)
    end
  end
end
