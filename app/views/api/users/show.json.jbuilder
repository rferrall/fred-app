json.partial! "user", user: @user

#needs access to the goals partial

json.goals do 
  json.array! @user.goals, partial: "api/goals/goal", as: :goal
  
end
