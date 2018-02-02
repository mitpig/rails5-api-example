require 'rails_helper'

RSpec.describe "User requests", type: :request do

  context "With valid Password" do

    describe "POST /api/v1/login" do
      before { post "#{ @base_url }/login" }
      it "Returns authorized status" do
        expect(response).to have_http_status(:ok)
      end
    end

  end

end
