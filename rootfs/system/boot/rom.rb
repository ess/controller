Controller::Container.namespace 'persistence' do |persistence|
  persistence.boot(:rom) do
    init do
      require 'sequel'
      require 'rom'

      Sequel.database_timezone = :utc
      Sequel.application_timezone = :utc

      rom_config = ROM::Configuration.new(
        :sql,
        ENV['DATABASE_URL'],
        extensions: [:error_sql]
      )

      persistence_path = Pathname(__FILE__).join('../../../lib/persistence')
      rom_config.auto_registration(persistence_path)

      persistence.register(:rom, ROM.container(rom_config))
    end

  end
end
