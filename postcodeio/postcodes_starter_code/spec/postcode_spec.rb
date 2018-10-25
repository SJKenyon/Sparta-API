require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('LS249RR') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status).to eq 200
    end

    it "should have a results hash" do
      expect(@response).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_postcode_length).to be_between(5,7).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_quality_key).to be_between(1,9).inclusive
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.o_survey).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.country).to eq('England').or(eq('Scotland')).or(eq('Wales')).or(eq('Northern Ireland'))
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.nhs_auth).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.long_float).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@postcodesio.lat_float).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.pariment).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.eu_region).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.primary_care).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@postcodesio.region).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@postcodesio.parish).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@postcodesio.lsoa).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@postcodesio.msoa).to be_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.admin_district).to be_kind_of(String)
    end

#     it "should return a incode string of 3-4 characters" do
#     end

  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(["OX49 5NU", "M32 0JG", "NE30 1DP"]) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_multi_status).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.first_postcode).to eq("OX49 5NU")
    end

    it "should return the second query as the first postcode in the response" do
      expect(@postcodesio.second_postcode).to eq("M32 0JG")
    end

    it "should have a results hash" do
      expect(@response).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.postcode_length).to all(be_between(5,7).inclusive)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.quality_key_length).to all(be_between(1,9).inclusive)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.eastings).to all(be_kind_of(Integer))
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.countries).to all(eq('England').or(eq('Scotland')).or(eq('Wales')).or(eq('Northern Ireland')))
    end

#     it "should return a string value for NHS authority " do
#     end
#
#     it "should return a longitude float value" do
#     end
#
#     it "should return a latitude float value" do
#     end
#
#     it "should return a parliamentary constituency string" do
#     end
#
#     it "should return a european_electoral_region string" do
#     end
#
#     it "should return a primary_care_trust string" do
#     end
#
#     it "should return a region string" do
#     end
#
#     it "should return a parish string" do
#     end
#
#     it "should return a lsoa string" do
#     end
#
#     it "should return a msoa string" do
#     end
#     # admin ward and county are not documented however tested below
#
#     it "should return a admin_district string" do
#     end
#
#     it "should return a incode string of 3-4 characters" do
#     end
#
  end

end
