class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user

  validates :comment, presence: true
  validates :comment, length: { minimum: 4 }
end
