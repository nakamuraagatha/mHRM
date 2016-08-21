require "rails_helper"

RSpec.describe EntendedDemographicsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/entended_demographics").to route_to("entended_demographics#index")
    end

    it "routes to #new" do
      expect(:get => "/entended_demographics/new").to route_to("entended_demographics#new")
    end

    it "routes to #show" do
      expect(:get => "/entended_demographics/1").to route_to("entended_demographics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/entended_demographics/1/edit").to route_to("entended_demographics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/entended_demographics").to route_to("entended_demographics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/entended_demographics/1").to route_to("entended_demographics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/entended_demographics/1").to route_to("entended_demographics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/entended_demographics/1").to route_to("entended_demographics#destroy", :id => "1")
    end

  end
end
