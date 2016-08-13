require "rails_helper"

RSpec.describe CoreDemographicsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core_demographics").to route_to("core_demographics#index")
    end

    it "routes to #new" do
      expect(:get => "/core_demographics/new").to route_to("core_demographics#new")
    end

    it "routes to #show" do
      expect(:get => "/core_demographics/1").to route_to("core_demographics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core_demographics/1/edit").to route_to("core_demographics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core_demographics").to route_to("core_demographics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core_demographics/1").to route_to("core_demographics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core_demographics/1").to route_to("core_demographics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core_demographics/1").to route_to("core_demographics#destroy", :id => "1")
    end

  end
end
