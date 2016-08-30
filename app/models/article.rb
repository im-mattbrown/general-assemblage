class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :city, :article_type,
    presence: true

  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 100 }

  validates :content,
    presence: true,
    length: { minimum: 1, maximum: 1000 }

  TYPE = ["Help Wanted", "General Info", "Off Topic"];
  CITY = ["Atlanta", "Austin", "Boston", "Chicago", "Denver", "Hong Kong", "London", "Los Angeles", "Melbourne", "New York City", "San Francisco", "Singapore", "Sydney", "Washington DC"];
end
