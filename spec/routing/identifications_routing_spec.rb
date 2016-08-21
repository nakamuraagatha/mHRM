require "rails_helper"

RSpec.describe IdentificationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/identifications").to route_to("identifications#index")
    end

    it "routes to #new" do
      expect(:get => "/identifications/new").to route_to("identifications#new")
    end

    it "routes to #show" do
      expect(:get => "/identifications/1").to route_to("identifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/identifications/1/edit").to route_to("identifications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/identifications").to route_to("identifications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/identifications/1").to route_to("identifications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/identifications/1").to route_to("identifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/identifications/1").to route_to("identifications#destroy", :id => "1")
    end

  end
end
