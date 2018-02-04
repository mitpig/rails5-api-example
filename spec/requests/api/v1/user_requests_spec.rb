  require 'rails_helper'

RSpec.describe "User requests", type: :request do
  let(:json_response) { JSON.parse(response.body) }
  let(:valid_user_params){
    {
      "email" => "ptapscott0@spiegel.de",
      "password" => "vFStrrnk4s",
      "first_name" => "Test First",
      "last_name" => "Test Last",
      "Username" => "thisisanexample"
    }
  }

  context "with valid password" do

    describe "POST /api/v1/login" do
      before do
        post "#{ @base_url }/login",
        params: valid_user_params, as: :json
      end
      it "returns correct params and authorized status" do
        expect(json_response["success"]).to eq true
        expect(json_response["username"]).to be_a String
        expect(json_response["auth_token"]).to be_a String
        expect(response).to have_http_status :ok
      end
    end

  end

  context "with non valid password" do
    let(:invalid_user_params){
      {
        "email" => "testing@spiegel.de",
        "password" => "testpwd"
      }
    }

    describe "POST /api/v1/login" do
      before do
        post "#{ @base_url }/login",
        params: invalid_user_params,
        as: :json
      end
      it "returns unauthorized status" do
        expect(json_response["status"]).to eq false
        expect(response).to have_http_status :unauthorized
      end
    end

  end

  context "with valid JWT" do
    let(:jwt_header){ {"Authorization": login(@valid_user)} }

    describe "GET /api/v1/users/:Username" do
      before do
        get "#{ @base_url }/users/#{ @valid_user.Username }",
        headers: jwt_header,
        as: :json
      end
      it "should show user information with ok status" do
        expect(json_response["first_name"]).to be_a String
        expect(json_response["last_name"]).to be_a String
        expect(json_response["email"]).to be_a String
        expect(response).to have_http_status :ok
      end
    end

    describe "POST /api/v1/users" do
      before do
        post "#{ @base_url }/users",
        headers: jwt_header,
        params: valid_user_params, as: :json
      end
      it "creates user and returns ok status" do
        expect(json_response["status"]).to eq true
        expect(response).to have_http_status :ok
      end
    end

    describe "PUT /api/v1/users/:Username" do
      before do
        put "#{ @base_url }/users/#{ @valid_user.Username }",
        headers: jwt_header,
        params: valid_user_params, as: :json
      end
      it "updates user and returns ok status" do
        expect(json_response["status"]).to eq true
        expect(response).to have_http_status :ok
      end
    end

    describe "DELETE /api/v1/users/:Username" do
      before do
        delete "#{ @base_url }/users/#{ @valid_user.Username }",
        headers: jwt_header
      end
      it "deletes an user and returns ok status" do
        expect(json_response["status"]).to eq true
        expect(response).to have_http_status :ok
      end
    end
  end
end
