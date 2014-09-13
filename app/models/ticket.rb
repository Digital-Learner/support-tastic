class Ticket < ActiveRecord::Base
  belongs_to :department

  before_save :downcase_email!

  validates :name, :subject, :detail, presence: true
  validates :department, presence: true

  validates :name, length: { in: 4..45 }

  # validates :email, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  # validates :email, uniqueness: { case_sensitive: false }

  private
    def downcase_email!
      self.email.downcase!
    end
end
