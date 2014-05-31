require 'spec_helper'

describe EmotionsController do
  context "GET#index" do
    before do
      Emotion.create(name: "Happy")
    end

    it "returns a list of all emotions" do
      get :index, format: "json"
      json = JSON.parse(response.body)['emotions']
      expect(json.length).to eq 1
      expect(json.first['id']).to be
      expect(json.first['name']).to eq "Happy"
    end
  end
end
