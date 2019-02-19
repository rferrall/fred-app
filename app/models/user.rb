class User < ApplicationRecord
  # has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :conversations
  has_many :messages
  has_many :goals

  # validates_uniqueness_of :sender_id, :scope => :recipient_id
  
  # scope :between, -> (sender_id,recipient_id) do where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  # end
end
