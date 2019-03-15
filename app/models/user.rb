class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  
  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", id,id)
  end
  
  has_many :messages
  has_many :goals

  def active_goal
    
    active_goal = goals.find_by(active: true)
    if active_goal
      if active_goal.end_date < Date.today
        active_goal.update(active: false) 
        return nil #breaks the function, so it won't return active_goal anyway.
      else 
        return active_goal
      end
    end
    return nil
  end

 
  # validates_uniqueness_of :sender_id, :scope => :recipient_id
  
  # scope :between, -> (sender_id,recipient_id) do where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  # end
end

