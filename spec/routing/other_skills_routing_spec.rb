require "rails_helper"

RSpec.describe OtherSkillsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/other_skills").to route_to("other_skills#index")
    end

    it "routes to #new" do
      expect(:get => "/other_skills/new").to route_to("other_skills#new")
    end

    it "routes to #show" do
      expect(:get => "/other_skills/1").to route_to("other_skills#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/other_skills/1/edit").to route_to("other_skills#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/other_skills").to route_to("other_skills#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/other_skills/1").to route_to("other_skills#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/other_skills/1").to route_to("other_skills#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/other_skills/1").to route_to("other_skills#destroy", :id => "1")
    end

  end
end
