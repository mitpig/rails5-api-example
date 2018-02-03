require 'rails_helper'

RSpec.describe "User requests", type: :request do
  let(:json_response) { JSON.parse(response.body) }
  let(:valid_user_params){
    {
      "email" => "ptapscott0@spiegel.de",
      "password" => "vFStrrnk4s"
    }
  }

  context "with valid password" do

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

end
