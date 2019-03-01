class Api::MessagesController < ApplicationController



  def create
    @message = Message.new(
      body: params[:body],
      user_id: current_user.id,
      conversation_id: params[:conversation_id]
      )
    if @message.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @message.errors.full_messages}, status: :unprocessable_entity
    end
    
  end



 
end
