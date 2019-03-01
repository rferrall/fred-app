json.partial! "user", user: @user



# if user.active_goal = true
  json.active_goal do 
    json.partial! @user.active_goal, partial: "api/goals/goal", as: :goal
  end
# else
#   render json: {message: 'Start a goal!'}, status: :created

# end


# json.goals do 
#   json.array! @user.goals, partial: "api/goals/goal", as: :goal
  
# end
