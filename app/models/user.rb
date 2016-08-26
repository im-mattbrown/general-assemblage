class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :comments, :through => :articles

  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end
end
