class Api::MessagesController < ApplicationController

require 'twilio-ruby'


  def create
    @message = Message.new(
      body: params[:body],
      user_id: current_user.id,
      conversation_id: params[:conversation_id]
      )
    if @message.save

      account_sid = ENV["ACCOUNT_SID"]
      auth_token = ENV["AUTH_TOKEN"] 
      conversation = @message.conversation  
      if conversation.sender_id == current_user.id
        twilio_phone_number = conversation.recipient.phone_number
      else
        twilio_phone_number = conversation.sender.phone_number
      end
      if twilio_phone_number
        @client = Twilio::REST::Client.new account_sid, auth_token
        message = @client.messages.create(
            body: "Alert from Fred => You have a new message from #{current_user.name}",
            to: twilio_phone_number,    
            from: "+19523334671") 
      end
       
      render 'show.json.jbuilder'
    else
      render json: {errors: @message.errors.full_messages}, status: :unprocessable_entity
    end
    
  end



 
end
