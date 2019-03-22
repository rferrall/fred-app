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

      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.messages.create(
          body: "You have a new message from Fred",
          to: "+17632422868",    
          from: "+19523334671")  
      render 'show.json.jbuilder'
    else
      render json: {errors: @message.errors.full_messages}, status: :unprocessable_entity
    end
    
  end



 
end
