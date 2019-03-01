class Api::ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @conversations = current_user.conversations
    render 'index.json.jbuilder'
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversation.messages.sort
    render 'show.json.jbuilder'
  end
  ##############################################
# The create action is broken. needs to check if a convo already exists between two users.
# if not THEN create a new conversation. Too many render statements in errors.

  # def create
  #   if Conversation.between(params[:sender_id],params[:recipient_id])
  #    .present? #do I need this the other way around as well? so a convo between users 1 &4, will also check 4,1?
  #     @conversation = Conversation.between(params[:sender_id],
  #      params[:recipient_id]).first
  #   else
  #     @conversation = Conversation.new(
  #       sender_id: current_user.id,
  #       # recipient_id: user.id.rand(user.conversations < 2)),
  #       recipient_id: 2)
  #     if @conversation.save
  #       render 'show.json.jbuilder'
  #     else
  #       render json: {errors: @conversation.errors.full_messages}, status: :unprocessable_entity
  #     end
  #   end
  #   render 'show.json.jbuilder'
  #   # redirect_to conversation_messages_path(@conversation)
  # end


end
