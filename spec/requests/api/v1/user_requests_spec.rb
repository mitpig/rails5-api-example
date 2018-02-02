require 'rails_helper'

RSpec.describe "User requests", type: :request do

  context "With valid Password" do

    describe "POST /api/v1/login" do

      before { post "/" }
      it "Returns unauthorized status" do
        expect(response).to have_http_status(:unauthorized)
      end

    end

  end

end
