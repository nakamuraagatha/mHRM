require "rails_helper"

RSpec.describe CertificationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/certifications").to route_to("certifications#index")
    end

    it "routes to #new" do
      expect(:get => "/certifications/new").to route_to("certifications#new")
    end

    it "routes to #show" do
      expect(:get => "/certifications/1").to route_to("certifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/certifications/1/edit").to route_to("certifications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/certifications").to route_to("certifications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/certifications/1").to route_to("certifications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/certifications/1").to route_to("certifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/certifications/1").to route_to("certifications#destroy", :id => "1")
    end

  end
end
