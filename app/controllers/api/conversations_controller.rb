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
  

  def create
    matched_user = nil
    users = User.where("id != ?", current_user.id).select{|user| user.active_goal} #.select used like map to filter through users. used because it's a model method and not an attribute on the model.
    users.each do |user|
      if user.conversations.count == 0 
        matched_user = user #want loop to break if find 0 convo user, else keep running.
        break
      elsif user.conversations.count < 3 
        matched_user = user #sets new variable not a return because want loop to run to find least amt of convos user.
        break
      end
    end
    if !matched_user
      matched_user = users.sample
    end
  


    if Conversation.between(current_user.id, matched_user.id)
     .present? 
      @conversation = Conversation.between(current_user.id,
       matched_user.id).first
    # elsif Conversation.where("sender_id = ? AND created_at = ?", current_user.id, Date.today) 
    #   return render json: {errors: 'Conversation already started today.'}, status: :bad_request
       
    else
      @conversation = Conversation.new(
        sender_id: current_user.id,
        recipient_id: matched_user.id)
    end

    if @conversation.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @conversation.errors.full_messages}, status: :unprocessable_entity
    end
    # redirect_to conversation_messages_path(@conversation)
  end


end
