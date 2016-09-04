require 'rails_helper'

RSpec.describe "OtherSkills", type: :request do
  describe "GET /other_skills" do
    it "works! (now write some real specs)" do
      get other_skills_path
      expect(response).to have_http_status(200)
    end
  end
end
