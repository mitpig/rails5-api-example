require 'rails_helper'

RSpec.describe "User requests", type: :request do
  let(:json_response) { JSON.parse(response.body) }

  context "with valid password" do
    let(:valid_user_params){
      {
        "email" => "ptapscott0@spiegel.de",
        "password" => "vFStrrnk4s"
      }
    }

    describe "POST /api/v1/login" do
      before do
        post "#{ @base_url }/login",
        params: valid_user_params, as: :json
      end
      it "returns authorized status" do
        expect(response).to have_http_status(:ok)
      end
    end

  end

  context "with non valid password" do
    let(:invalid_user_params){
      {
        "email" => "testing@spiegel.de",
        "password" => "vFStrrnk4s"
      }
    }

    describe "POST /api/v1/login" do
      before do
        post "#{ @base_url }/login",
        params: invalid_user_params,
        as: :json
      end
      it "returns unauthorized status" do
        expect(response).to have_http_status(:unauthorized)
      end
    end

  end

end
