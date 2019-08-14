Then 'the response status is {int}' do |status|
  expect(response.status).to eql(status)
end

Then 'the HTML body in the response is {string}' do |body|
  expect(response.body).to eql(body)
end

Then 'the response includes the magic DEIS headers' do
  response.headers.keys.tap do |present|
    expect(present).to include('DEIS_API_VERSION')
    expect(present).to include('DEIS_PLATFORM_VERSION')
  end
end
