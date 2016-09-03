require 'rails_helper'

RSpec.describe "Clearances", type: :request do
  describe "GET /clearances" do
    it "works! (now write some real specs)" do
      get clearances_path
      expect(response).to have_http_status(200)
    end
  end
end
