class Api::ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @conversations = current_user.conversations.order(created_at: :desc)
    render 'index.json.jbuilder'
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversation.messages.sort
    render 'show.json.jbuilder'
  end
  ##############################################
# needs to check if a convo already exists between two users.
# # if not THEN create a new conversation. 

#   def create
#     # available_partners = (@user???).where(:user != :current_user)
#     if Conversation.between(params[:sender_id],params[:recipient_id])
#      .present? 
#       @conversation = Conversation.between(params[:sender_id],
#        params[:recipient_id]).first
#     else
#       @conversation = Conversation.new(
#         sender_id: current_user.id,
#         # recipient_id: user.id.rand(user.conversations < 2)),
#         recipient_id: available_partners.sample)
#     end
#     if @conversation.save
#         render 'show.json.jbuilder'
#       else
#         render json: {errors: @conversation.errors.full_messages}, status: :unprocessable_entity
#     end
#     # redirect_to conversation_messages_path(@conversation)
#   end


end
