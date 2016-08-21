require 'rails_helper'

RSpec.describe "EntendedDemographics", type: :request do
  describe "GET /entended_demographics" do
    it "works! (now write some real specs)" do
      get entended_demographics_path
      expect(response).to have_http_status(200)
    end
  end
end
