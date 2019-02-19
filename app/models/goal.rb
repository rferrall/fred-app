class Goal < ApplicationRecord

  belongs_to :user

  validates_presence_of :goal, :end_date, :subject
end
