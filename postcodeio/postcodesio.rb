require "httparty"
require "json"

class Postcode
  include HTTParty

  attr_accessor :single_postcode_results, :multi_postcode_results

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_results = self.class.get("/postcodes/#{postcode}")
  end

  def get_multiple_postcodes(postcode_array)
    @multi_postcode_results = self.class.post("/postcodes/", body: { "postcodes": postcode_array }).body
    puts JSON.parse(@multi_postcode_results)["status"]
  end

end

postcode = Postcode.new
postcode.get_single_postcode("B601JA")
postcode.get_multiple_postcodes(["OX49 5NU", "M32 0JG", "NE30 1DP"])

# p postcode.single_postcode_results
# p postcode.multi_postcode_results
