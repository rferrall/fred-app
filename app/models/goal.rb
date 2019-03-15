class Goal < ApplicationRecord

  belongs_to :user

  validates_presence_of :goal, :subject, :end_date

  validate :end_date_is_in_the_future


  def end_date_is_in_the_future
      if end_date.present? && end_date <= Date.today
      errors.add(:end_date, "must be in the future")
    end
    
  end


  

 # def active_goal
 #    # goals.find_by("active = ? AND end_date > ?", true, Time.now )
 #    active_goal = goals.find_by(active: true)
 #    if active_goal.end_date < Time.now
 #      active_goal.update(active: false) 
 #      return nil #breaks the function, so it won't return active_goal anyway.
 #    end
 #    active_goal
 #  end

  

end
