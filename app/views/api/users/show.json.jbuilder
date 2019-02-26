json.partial! "user", user: @user

json.active_goal do 
  json.partial! @user.active_goal, partial: "api/goals/goal", as: :goal

end

# json.goals do 
#   json.array! @user.goals, partial: "api/goals/goal", as: :goal
  
# end
