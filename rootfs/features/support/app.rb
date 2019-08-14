require_relative '../../application'

module AppWrapper
  def app
    Application
  end
end

World(AppWrapper)
