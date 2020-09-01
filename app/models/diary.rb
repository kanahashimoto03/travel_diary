class Diary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :country
  belongs_to_active_hash :category

  has_one_attached :image
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :image
    validates :country_id
    validates :city
    validates :category_id
    validates :date
    validates :recommendations
  end

  with_options numericality: { other_than: 1, message: 'Select'} do
    validates :country_id
    validates :category_id
  end  
  
end
