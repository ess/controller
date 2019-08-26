require 'rom-repository'

Controller::Container.start(:rom)

module Controller
  class Repository < ROM::Repository::Root
    def self.new(rom = nil)
      super(rom || Controller::Container['persistence.rom'])
    end
  end
end
