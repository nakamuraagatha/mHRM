require 'rails_helper'

RSpec.describe "CoreDemographics", type: :request do
  describe "GET /core_demographics" do
    it "works! (now write some real specs)" do
      get core_demographics_path
      expect(response).to have_http_status(200)
    end
  end
end
