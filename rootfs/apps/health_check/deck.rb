module HealthCheck
  class Deck < Syro::Deck
    def disallow
      res.status = 405
      res.html('This method is not allowed')
    end

    def okay
      res.html('OK')
    end
  end
end
