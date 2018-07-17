require 'httparty'
require 'json'

class SinglePostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_response
    @single_postcode_data["status"]
  end

  def print_results
    @single_postcode_data
  end

  def get_length
    @single_postcode_data['result']['postcode'].gsub(' ','').length
  end

  def quality_key
    @single_postcode_data['result']['quality']
  end

  def eastings
    @single_postcode_data['result']['eastings']
  end

  def eastings
    @single_postcode_data['result']['eastings']
  end

  def country
    @single_postcode_data['result']['country']
  end

  def nhs
    @single_postcode_data['result']['nhs_ha']
  end

  def longitude
    @single_postcode_data['result']["longitude"]
  end

  def latitude
    @single_postcode_data['result']["latitude"]
  end

  def parliment
    @single_postcode_data['result']['parliamentary_constituency']
  end

  def eu_elect
    @single_postcode_data['result']['european_electoral_region']
  end

  def primary
    @single_postcode_data['result']['primary_care_trust']
  end

  def region
    @single_postcode_data['result']['region']
  end

  def parish
    @single_postcode_data['result']['parish']
  end

  def lsoa
    @single_postcode_data['result']['lsoa']
  end

  # def get_postocde
  #   @single_postcode_data["result"]["postcode"]
  # end

end

# call = SinglePostcodeService.new
# call.get_single_postcode("LS249RR")
# puts call.print_results
# call.get_postcode
