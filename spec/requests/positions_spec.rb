require 'rails_helper'

RSpec.describe "Positions", type: :request do
  describe "GET /positions" do
    it "works! (now write some real specs)" do
      get positions_path
      expect(response).to have_http_status(200)
    end
  end
end
