When %r{^I perform a GET request for (.+)$} do |path|
  set_response(get(path))
end

When %r{I perform a HEAD request for (.+)$} do |path|
  set_response(head(path))
end

When %r{I perform a POST request for (.+)$} do |path|
  set_response(post(path, nil))
end

When %r{I perform a PUT request for (.+)$} do |path|
  set_response(put(path, nil))
end

When %r{I perform a PATCH request for (.+)$} do |path|
  set_response(patch(path, nil))
end

When %r{I perform a DELETE request for (.+)$} do |path|
  set_response(delete(path, nil))
end

