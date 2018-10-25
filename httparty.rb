require 'httparty'

response = HTTParty.get("http://bbc.co.uk/news")

# puts response
# puts response.body
puts response.code
puts response.message
puts response.headers
puts response.headers.inspect
