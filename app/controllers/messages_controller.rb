class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    Message.create! message_params

    redirect_to root_path
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
