Given %(I have no authentication information) do
  unset_token
end

Given %(I have valid authentication information) do
  set_token('supersekrattoken')
end

Given %(I have invalid authentication information) do
  set_token('totallyunknowntoken')
end

Given %(I have authentication information for an admin user) do
  u = create_admin_user
  t = token_for_user(u)
  fail "not implemented"
end

Given %(I have authentication information for a non-admin user) do
  fail "not implemented"
end
