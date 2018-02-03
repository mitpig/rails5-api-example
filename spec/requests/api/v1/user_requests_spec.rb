require 'rails_helper'

RSpec.describe "User requests", type: :request do
  let(:valid){
    {
      "username" => "pepe",
      "password" => "asdsad"
    }
  }

  context "with valid password" do

    describe "POST /api/v1/login" do
      before { post "#{ @base_url }/login" }
      it "returns authorized status" do
        expect(response).to have_http_status(:ok)
      end
    end

  end

end
