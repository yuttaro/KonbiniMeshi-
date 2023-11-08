class Post < ActiveRecord::Base
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  belongs_to :user
end