Then 'the response status is {int}' do |status|
  expect(response.status).to eql(status)
end

Then 'the HTML body in the response is {string}' do |body|
  expect(response.body).to eql(body)
end
