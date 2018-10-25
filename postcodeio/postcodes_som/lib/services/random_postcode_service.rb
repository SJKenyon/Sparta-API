require 'httparty'
require 'json'

class RandomPostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_random_postcode
    @random_postcode_data = JSON.parse(self.class.get("/random/postcodes").body)["result"]["postcode"].gsub(" ","")
  end

  def get_result
    @random_postcode_data
  end

end

call = RandomPostcodeService.new
puts call.get_random_postcode
call.get_result
# puts call.get_postcode
