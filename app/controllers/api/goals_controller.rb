class Api::GoalsController < ApplicationController


  def index
    @goals = Goal.where(user_id: 4)
    render 'index.json.jbuilder'
  end


  def show
    @goal = Goal.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create

     @goal = Goal.new(
    user_id: params["user_id"],
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
   @goal = Goal.find(params[:id])

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
    @goal = Goal.find(params[:id])
    @goal.destroy
  end
end
