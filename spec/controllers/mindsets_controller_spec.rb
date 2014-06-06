require 'spec_helper'

describe MindsetsController do
  include Devise::TestHelpers

  context "POST#create" do
    let(:emotion) { Emotion.create(name: "Happy") }
    let(:user) { User.create(email: "person@example.com", password: "12345678") }

    before do
      sign_in user
      post :create, mindset: {emotion_id: emotion.id}
    end

    it "create a new mindset" do
      mindset = assigns(:mindset)
      expect(mindset).to be_persisted
    end
  end
end

