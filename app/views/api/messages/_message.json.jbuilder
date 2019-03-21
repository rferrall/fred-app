# json.messages do 
#   # json.array! @user.messages, partial: "api/goals/goal", as: :goal
  
# end
# json.users do 
#   json.array! @message.users, partial: "api/users/user", as: :user
  
# end

# json.sender message.sender_id
json.id message.id
json.user message.user.name
json.user_id  message.user_id
json.body message.body
json.created_at message.created_at