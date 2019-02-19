class Api::ConversationsController < ApplicationController

  def index
    @conversations = current_user_id.conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversation.messages.sort
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id])
     .present? #do I need this the other way around as well? so a convo between users 1 &4, will also check 4,1?
      @conversation = Conversation.between(params[:sender_id],
       params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
