class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  TYPE = ["Help wanted", "General Info", "Off topic"];
  CITY = ["Atlanta", "Austin", "Boston", "Chicago", "Denver", "Hong Kong", "London", "Los Angeles", "Melbourne", "New York City", "San Francisco", "Singapore", "Sydney", "Washington DC"];
end
