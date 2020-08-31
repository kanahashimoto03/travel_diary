class Diary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :country
  belongs_to_active_hash :category

  has_one_attached :image
  belongs_to :user
  has_many :comments
  
end
