require "rails_helper"

RSpec.describe ClearancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/clearances").to route_to("clearances#index")
    end

    it "routes to #new" do
      expect(:get => "/clearances/new").to route_to("clearances#new")
    end

    it "routes to #show" do
      expect(:get => "/clearances/1").to route_to("clearances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/clearances/1/edit").to route_to("clearances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/clearances").to route_to("clearances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clearances/1").to route_to("clearances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clearances/1").to route_to("clearances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clearances/1").to route_to("clearances#destroy", :id => "1")
    end

  end
end
