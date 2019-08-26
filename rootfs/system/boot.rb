require_relative 'controller/container'

Controller::Container.finalize! do |container|
end

require_relative 'controller/persistence'
