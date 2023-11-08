class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  has_one_attached :recipe_image

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_recipe_image(width, height)
    unless recipe_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      recipe_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      recipe_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @recipe = Recipe.where("recipe_name LIKE?","#{word}")
    elsif search == "forward_match"
      @recipe = Recipe.where("recipe_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @recipe = Recipe.where("recipe_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @recipe = Recipe.where("recipe_name LIKE?","%#{word}%")
    else
      @recipe = Recipe.all
    end
  end

end
