json.array! @conversations.each do |conversation|
  json.id conversation.id
  json.created_at conversation.created_at
  json.partner do 
    if conversation.sender_id == current_user.id
      json.partial! conversation.recipient, partial: "api/users/user", as: :user
    else 
      json.partial! conversation.sender, partial: "api/users/user", as: :user
    end
  end

end


