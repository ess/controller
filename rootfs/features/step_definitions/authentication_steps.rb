Given 'I have no authentication information' do
  unset_token
end

Given 'I have valid authentication information' do
  set_token('supersekrattoken')
end

Given 'I have invalid authentication information' do
  set_token('totallyunknowntoken')
end
