class EmotionsController < ApplicationController
  respond_to :json

  serialization_scope nil

  def index
    respond_with Emotion.all
  end
end
