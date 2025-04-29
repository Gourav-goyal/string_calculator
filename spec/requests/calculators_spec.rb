require 'rails_helper'

RSpec.describe "Calculators", type: :request do
  describe "POST /add" do
    it "returns 0 for empty string" do
      post "/add", numbers: ""
      expect(JSON.parse(response.body)["result"]).to eq(0)
    end

    it "returns number itself for single number" do
      post "/add", numbers: "5"
      expect(JSON.parse(response.body)["result"]).to eq(5)
    end

    it "adds two numbers" do
      post "/add", numbers: "1,2"
      expect(JSON.parse(response.body)["result"]).to eq(3)
    end

    it "adds multiple numbers" do
      post "/add", numbers: "1,2,3,4"
      expect(JSON.parse(response.body)["result"]).to eq(10)
    end

    it "supports newlines between numbers" do
      post "/add", numbers: "1\n2,3"
      expect(JSON.parse(response.body)["result"]).to eq(6)
    end
  end
end
