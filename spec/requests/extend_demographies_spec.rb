require 'rails_helper'

RSpec.describe "ExtendDemographies", type: :request do
  describe "GET /extend_demographies" do
    it "works! (now write some real specs)" do
      get extend_demographies_path
      expect(response).to have_http_status(200)
    end
  end
end
