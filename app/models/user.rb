class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :comments, :through => :articles

  validates :first_name, :last_name, :course_taken, :city,
    presence: true,
    length: { minimum: 1, maximum: 200 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
    presence: true,
    format: { with: EMAIL_REGEX},
    uniqueness: true,
    length: { maximum: 200 }

  validates :user_name,
    presence: true,
    uniqueness: true,
    length: { minimum: 1, maximum: 20 }

  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end

  CITIES = ["Atlanta", "Austin", "Boston", "Chicago", "Denver", "Hong Kong", "London", "Los Angeles", "Melbourne", "New York City", "San Francisco", "Singapore", "Sydney", "Washington DC"]
  COURSE = ["WDI", "UXDI", "DSI", "ADI", "IOSI"]
end
