class MindsetsController < ApplicationController
  before_filter :authenticate_user!

  layout "application"
  respond_to :html

  def new
    @emotions = current_user.emotion_group.emotions
    @mindset = Mindset.new
    respond_with @mindset
  end

  def create
    @mindset = current_user.mindsets.create(mindset_params)
    redirect_to new_mindset_path, notice: "We've recorded your mindset. Come again!"
  end

  private

  def mindset_params
    params.require(:mindset).permit(:emotion_id, :lat, :lng)
  end
end
