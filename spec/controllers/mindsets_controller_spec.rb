require 'spec_helper'

describe MindsetsController do
  include Devise::TestHelpers

  context "POST#create" do
    let(:emotion) { Emotion.create(name: "Happy") }
    let(:user) { User.create(email: "person@example.com", password: "12345678") }

    it "returns a list of all emotions" do
      sign_in user
      post :create, mindset: {emotion_id: emotion.id}, format: "json"
      json = JSON.parse(response.body)['mindset']
      expect(json['id']).to be
      expect(json['emotion']).to eq({"id"=>1, "name"=>"Happy"})
    end
  end
end

