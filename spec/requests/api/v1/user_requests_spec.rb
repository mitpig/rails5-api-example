require 'rails_helper'

RSpec.describe "User requests", type: :request do s

  context "with valid password" do
    # Valid user params on DB.
    let(:valid_params) {
      "email" => "asd",
      "password" => "asd"
    }

    describe "POST /api/v1/login" do
      before { post "#{ @base_url }/login" }
      it "returns authorized status" do
        expect(response).to have_http_status(:ok)
      end
    end

  end

end
