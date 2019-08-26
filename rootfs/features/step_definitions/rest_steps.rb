When %r{^I perform a GET request for (.+)$} do |path|
  set_response(get(path))
end

When %r{^I perform a HEAD request for (.+)$} do |path|
  set_response(head(path))
end

When %r{^I perform a POST request for (.+)$} do |path|
  set_response(post(path, nil))
end

When %r{^I perform a PUT request for (.+)$} do |path|
  set_response(put(path, nil))
end

When %r{^I perform a PATCH request for (.+)$} do |path|
  set_response(patch(path, nil))
end

When %r{^I perform a DELETE request for (.+)$} do |path|
  set_response(delete(path, nil))
end

When %r{^I GET (.+) with authentication$} do |path|
  with_authentication do
    set_response(get(path))
  end
end

When %r{^I GET (.+) without authentication$} do |path|
  without_authentication do
    set_response(get(path))
  end
end

When %r{^I POST my payload to (.+) with authentication$} do |path|
  with_authentication do
    with_json_body do
      set_response(post(path, JSON.dump(payload)))
    end
  end
end


When %r{^I POST my payload to (.+) without authentication$} do |path|
  without_authentication do
    with_json_body do
      set_response(post(path, JSON.dump(payload)))
    end
  end
end
