require 'rails_helper'

RSpec.describe "Cases", type: :request do
  describe "GET /cases" do
    it "works! (now write some real specs)" do
      get cases_path
      expect(response).to have_http_status(200)
    end
  end
end
