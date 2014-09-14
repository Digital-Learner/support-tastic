class Ticket < ActiveRecord::Base
  belongs_to :department

  before_save :downcase_email!
  before_save :generate_reference_id

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

    def generate_reference_id
      numeric = two_element_array_numeric_as_string
      alpha = three_element_array_string
      self.reference_id = [alpha[0].join, numeric[0], alpha[1].join, numeric[1], alpha[2].join].join('-')
    end

    def two_element_array_numeric_as_string
      2.times.map { ('001'..'999').to_a.sample }
    end

    def three_element_array_string
      3.times.map { ("A".."Z").to_a.sample(3) }
    end
end
