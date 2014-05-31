class MindsetsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def create
    mindset = current_user.mindsets.create(mindset_params)
    respond_with mindset, location: ""
  end

  private

  def mindset_params
    params.require(:mindset).permit(:emotion_id)
  end
end
