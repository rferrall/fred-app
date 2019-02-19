class Api::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user = User.find(params[:id])

    @user.name = params["name"] || @user.name
    @user.email = params["email"] || @user.email
    @user.image = params["image"] || @user.image


    if @user.save
      render 'show.json.jbuilder'
    else
      render json:{errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
  end


end
