require_relative "services/single_postcode_service"
require_relative "services/multi_postcode_service"
require_relative "services/random_postcode_service"

class Postcodesio

  def single_postcode_service
    SinglePostcodeService.new
  end

  def multiple_postcode_service
    MultiPostcodeService.new
  end

end

# p service = Postcodesio.new.single_postcode_service.get_single_postcode("LS249RR")
