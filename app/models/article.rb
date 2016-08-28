class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  TYPE = ["Help Wanted", "General Info", "Off Topic"];
  CITY = ["Atlanta", "Austin", "Boston", "Chicago", "Denver", "Hong Kong", "London", "Los Angeles", "Melbourne", "New York City", "San Francisco", "Singapore", "Sydney", "Washington DC"];
end
