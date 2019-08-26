require 'rom'
require 'rom-sql'

module Persistence
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:auth_user) do
        attribute :id, Types::Serial
        attribute :username, Types::Strict::String
        attribute :email, Types::Strict::String
        attribute :password, Types::Strict::String
        attribute :first_name, Types::Strict::String
        attribute :last_name, Types::Strict::String

        attribute :is_superuser, Types::Strict::Bool
        attribute :is_staff, Types::Strict::Bool
        attribute :is_active, Types::Strict::Bool

        attribute :date_joined, Types::Strict::DateTime
        attribute :last_login, Types::Strict::DateTime
      end

      def by_id(id)
        where(id: id)
      end

      def by_username(username)
        where(username: username)
      end
    end
  end
end
