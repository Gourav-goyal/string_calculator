require 'rails_helper'

RSpec.describe "Calculators", type: :request do
  describe "POST /add" do
    it "returns 0 for empty string" do
      post "/add", numbers: ""
      expect(JSON.parse(response.body)["result"]).to eq(0)
    end
  end
end
