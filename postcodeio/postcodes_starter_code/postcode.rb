require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  attr_accessor :single_postcode_results, :multi_postcode_results

  base_uri 'https://api.postcodes.io'

  # def initialize
  #
  # end

  def get_single_postcode(postcode)
    @single_postcode_results = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes_array)
    @multi_postcode_results = JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def get_status
    @single_postcode_results["status"]
  end

  def get_postcode_length
    @single_postcode_results["result"]["postcode"].gsub(" ", "").length
  end

  def get_quality_key
    @single_postcode_results["result"]["quality"].to_i
  end

  def o_survey
    @single_postcode_results["result"]["eastings"].to_i
  end

  def country
    @single_postcode_results["result"]["country"]
  end

  def nhs_auth
    @single_postcode_results["result"]["nhs_ha"]
  end

  def long_float
    @single_postcode_results["result"]["longitude"].to_f
  end

  def lat_float
    @single_postcode_results["result"]["latitude"].to_f
  end

  def pariment
    @single_postcode_results["result"]["parliamentary_constituency"]
  end

  def eu_region
    @single_postcode_results["result"]["european_electoral_region"]
  end

  def primary_care
    @single_postcode_results["result"]["primary_care_trust"]
  end

  def region
    @single_postcode_results["result"]["region"]
  end

  def parish
    @single_postcode_results["result"]["parish"]
  end

  def lsoa
    @single_postcode_results["result"]["lsoa"]
  end

  def msoa
    @single_postcode_results["result"]["msoa"]
  end

  def admin_district
    @single_postcode_results["result"]["codes"]["admin_district"]
  end

  def get_multi_status
    @multi_postcode_results["status"]
  end

  def first_postcode
    @multi_postcode_results["result"][0]["query"]
  end

  def second_postcode
    @multi_postcode_results["result"][1]["query"]
  end

  def first_postcode_length
    @multi_postcode_results["result"]["query"].gsub(" ", "").length
  end

  def quality_key_length

    # @multi_postcode_results["result"][array_length].each do
    #   ["quality"].length
    # end

    # multi_postcode_results["result"][i]["quality"].each do |key, value|
    #   value.length = ans
    # end
    # return ans
    # @multi_postcode_results["result"]["quality"].length
  end

end

home = Postcodesio.new
# puts home.get_single_postcode("LS249RR")
puts home.get_multiple_postcodes(["OX49 5NU", "M32 0JG", "NE30 1DP"])
