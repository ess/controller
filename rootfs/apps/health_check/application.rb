require_relative 'deck'

module HealthCheck
  Application = Syro.new(Deck) do
    get do
      okay
    end

    head do
      okay
    end

    post do
      disallow
    end

    put do
      disallow
    end

    patch do
      disallow
    end

    delete do
      disallow
    end
  end
end
