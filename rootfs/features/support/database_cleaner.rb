require_relative '../../system/boot'

require 'database_cleaner'

conn = Controller::Container['persistence.rom'].gateways[:default].connection

DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner[:sequel, connection: conn].strategy = :transaction
DatabaseCleaner[:sequel, connection: conn].clean_with(:truncation)

Around do |scenario, block|
  conn = Controller::Container['persistence.rom'].gateways[:default].connection

  DatabaseCleaner[:sequel, connection: conn].cleaning(&block)
end
