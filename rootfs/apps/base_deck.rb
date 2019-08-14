require 'syro'

class BaseDeck < Syro::Deck
  def default_headers
    {
      'DEIS_API_VERSION' => '2.3',
      'DEIS_PLATFORM_VERSION' => '2.3.0'
    }
  end

  def disallow
    res.status = 405
    res.html('This method is not allowed')
  end

  def okay
    res.html('OK')
  end
end
