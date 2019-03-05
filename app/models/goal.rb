class Goal < ApplicationRecord

  belongs_to :user

  validates_presence_of :goal, :end_date, :subject

  

 def active_goal
    goals.find_by(active: true)
    
  end


end
