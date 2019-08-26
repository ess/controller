Given 'my JSON payload looks like this:' do |payload|
  set_payload(JSON.load(payload))
end

Given %r{^my payload (.+) is missing$} do |key|
  remove_payload_key(key)
end

Given %r{^my payload (.+) is "([^""]*)"$} do |key, value|
  update_payload_key(key, value)
end

Given %r{^my payload (.+) isn't a string} do |key|
  update_payload_key(key, nil)
end

Given %(my payload email isn't a valid email) do
  update_payload_key('email', 'invalidemail@domain')
end
