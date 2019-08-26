Given %(there are no users) do
  clear_users
end

Given %(there is already an admin user) do
  create_admin_user(username: "admin")
end

Given %(there's already a user with the username {string}) do |existing_user|
  create_user(username: existing_user)
end

Then %(the {string} user is created) do |username|
  expect(user_by_username(username)).not_to be_nil
end

Then %(no user is created) do
  expect(upstream_user_count).to eql(user_count)
end
