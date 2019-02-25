class Api::UsersController < ApplicationController
before_action :authenticate_user, except: [:create]
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    # @user = User.find(params[:id])
     @user = current_user
      render 'show.json.jbuilder'
  end

  def update
    @user = current_user

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
    @user = current_user
    @user.destroy

    
    render json: {message: 'So sad to see you go. Thank you. Next.'}, status: :created
    
  end


end
