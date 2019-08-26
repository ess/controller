require_relative '../../../system/repository'

module Persistence
  module Repositories
    class Users < Controller::Repository[:auth_user]
      commands :create, update: :by_pk, delete: :by_pk

      def [](id)
        auth_user.by_id(id).one!
      end

      def named(username)
        auth_user.where(username: username).to_a
      end

      def all
        auth_user.to_a
      end

      def count
        auth_user.count
      end

      def admins
        auth_user.where(is_superuser: true).to_a
      end

    end
  end
end
