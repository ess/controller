require 'faker'

module UserHelpers
  def set_user_count(count)
    indifferently_memorize_fact(:user_count, count)
  end

  def user_count
    recall_fact(:user_count)
  end

  def users_repo
    Controller::Container['persistence.repositories.users']
  end

  def clear_users
    users_repo.all.each do |user|
      users_repo.delete(user.id)
    end

    raise "dafuq" unless users_repo.count == 0
    set_user_count(0)
  end

  def user_by_username(username)
    users_repo.named(username)
  end

  def create_admin_user(user = {})
    now = DateTime.now

    set_user_count(user_count + 1)

    users_repo.create(
      user.merge(
        {
          password: Faker::Lorem.characters(number: 12),
          email: Faker::Internet.email,
          first_name: '',
          last_name: '',
          is_superuser: true,
          is_staff: true,
          is_active: true,
          date_joined: now,
          last_login: now,
        }
      )
    )
  end

  def create_user(user = {})
    now = DateTime.now

    set_user_count(user_count + 1)

    users_repo.create(
      user.merge(
        {
          password: Faker::Lorem.characters(number: 12),
          email: Faker::Internet.email,
          first_name: '',
          last_name: '',
          is_superuser: false,
          is_staff: false,
          is_active: false,
          date_joined: now,
          last_login: now,
        }
      )
    )
  end

  def upstream_user_count
    users_repo.count
  end
end

World(UserHelpers)
