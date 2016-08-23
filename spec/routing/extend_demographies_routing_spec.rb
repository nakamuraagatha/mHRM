require "rails_helper"

RSpec.describe ExtendDemographiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/extend_demographies").to route_to("extend_demographies#index")
    end

    it "routes to #new" do
      expect(:get => "/extend_demographies/new").to route_to("extend_demographies#new")
    end

    it "routes to #show" do
      expect(:get => "/extend_demographies/1").to route_to("extend_demographies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/extend_demographies/1/edit").to route_to("extend_demographies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/extend_demographies").to route_to("extend_demographies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/extend_demographies/1").to route_to("extend_demographies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/extend_demographies/1").to route_to("extend_demographies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/extend_demographies/1").to route_to("extend_demographies#destroy", :id => "1")
    end

  end
end
