class User < ApplicationRecord
  has_secure_password

  belongs_to :company
  has_many :answers
  accepts_nested_attributes_for :company

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  def full_name
    "#{first_name} #{last_name}"
  end

  def gender_options
    ["Male", "Female", "Non-Binary", "Rather Not Say"]
  end

  def has_answered_all_q
    answers.count == company.questions.count
  end

end
