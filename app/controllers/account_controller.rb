class AccountController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @emotion_groups = EmotionGroup.all
  end

  def update
    @user = current_user.update_attributes(user_params)
    redirect_to account_path, notice: "Successfully update your account settings"
  end

  private

  def user_params
    params.require(:user).permit(:emotion_group_id)
  end
end
