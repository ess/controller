require 'dry/system/container'

module Controller
  class Container < Dry::System::Container
    configure do |config|
      puts Pathname(__FILE__).join('../..').realpath.dirname
      config.name = :core
      config.root = Pathname(__FILE__).join('../..').realpath.dirname.freeze
    end

    load_paths! 'lib'
    auto_register! 'lib'
    #auto_register! 'lib/persistence'
  end
end
