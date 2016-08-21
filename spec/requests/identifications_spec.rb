require 'rails_helper'

RSpec.describe "Identifications", type: :request do
  describe "GET /identifications" do
    it "works! (now write some real specs)" do
      get identifications_path
      expect(response).to have_http_status(200)
    end
  end
end
