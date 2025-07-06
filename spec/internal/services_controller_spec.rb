# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Servactory::Web::App::ServicesController", type: :request do
  let(:routes) { Servactory::Web::Engine.routes.url_helpers }

  describe "GET /servactory/app/services" do
    it "returns http success" do
      get routes.internal_services_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /services/app/:id" do
    context "when service exists" do
      it "returns http success and renders service info", :aggregate_failures do
        get routes.internal_service_path("full_name_service")
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("FullNameService")
        expect(response.body).to include("Inputs")
        expect(response.body).to include("Internals")
        expect(response.body).to include("Outputs")
        expect(response.body).to include("Actions")
        expect(response.body).to include("Source Code")
      end
    end

    context "when service does not exist" do
      it "returns http success and renders not found message", :aggregate_failures do
        get routes.internal_service_path("not_existing_service")
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("Service Not Found")
      end
    end
  end
end
