class Api::GoalsController < ApplicationController
before_action :authenticate_user

  def index
    @goals = current_user.goals.order(id: :desc)
    render 'index.json.jbuilder'
  end


  def show
    # @goal = Goal.find(params[:id])
    @goal =  current_user.goals.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create

     @goal = Goal.new(
    user_id: current_user.id,
    subject: params["subject"],
    goal: params["goal"],
    end_date: params["end_date"],
    frequency: params["frequency"],
    active: params["active"]
    
    )
   if @goal.save
    render 'show.json.jbuilder'
    else 
      render json:{errors: @goal.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def update
   @goal =  current_user.goals.find(params[:id])
    @goal.subject = params["subject"] || @goal.subject
    @goal.goal = params["goal"] || @goal.goal
    @goal.end_date = params["end_date"] || @goal.end_date
    @goal.frequency = params["frequency"] || @goal.frequency
    @goal.active = params["active"] || @goal.active


    if @goal.save
      render 'show.json.jbuilder'
    else
      render json:{errors: @goal.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @goal =  current_user.goals.find(params[:id])
    @goal.destroy

    render json: {message: 'Another goal done did. Thank you. Next.'}, status: :created
  end
end
