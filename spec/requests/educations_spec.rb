require 'rails_helper'

RSpec.describe "Educations", type: :request do
  describe "GET /educations" do
    it "works! (now write some real specs)" do
      get educations_path
      expect(response).to have_http_status(200)
    end
  end
end
