class Api::MessagesController < ApplicationController



  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      render '_conversation'
    end
    
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
