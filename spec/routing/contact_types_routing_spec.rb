require "rails_helper"

RSpec.describe ContactTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/contact_types").to route_to("contact_types#index")
    end

    it "routes to #new" do
      expect(:get => "/contact_types/new").to route_to("contact_types#new")
    end

    it "routes to #show" do
      expect(:get => "/contact_types/1").to route_to("contact_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/contact_types/1/edit").to route_to("contact_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/contact_types").to route_to("contact_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contact_types/1").to route_to("contact_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/contact_types/1").to route_to("contact_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contact_types/1").to route_to("contact_types#destroy", :id => "1")
    end

  end
end
