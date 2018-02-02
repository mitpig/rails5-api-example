require 'rails_helper'

RSpec.describe "User requests", type: :request do

  context "With valid Password" do
    describe "/api/v1/login" do
      post "/"
      expect(response).to have_http_status(:error)
    end
  end

end
