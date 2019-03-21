
json.id @conversation.id
json.created_at @conversation.created_at
json.updated_at @conversation.updated_at

json.sender do
  json.partial! @conversation.sender, partial: "api/users/user", as: :user

  if @conversation.sender.active_goal
    json.goal do
      json.partial! @conversation.sender.active_goal, partial: "api/goals/goal", as: :goal
    end
  end

end

json.recipient do
  json.partial! @conversation.recipient, partial: "api/users/user", as: :user
  if @conversation.recipient.active_goal
    json.goal do
      json.partial! @conversation.recipient.active_goal, partial: "api/goals/goal", as: :goal
    end
  end
end

# json.messages @conversation.messages.sort


#show user and goal

# json.goals do 
#   json.array! @conversation.messages.users.goals, partial: "api/goals/goal", as: :goal
  
# end

# json.users do
#   json.array!@conversation.users, partial: "api/users/user", as: :user

# end

json.messages do 
  json.array! @conversation.messages, partial: "api/messages/message", as: :message
    
end
