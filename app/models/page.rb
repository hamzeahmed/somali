class Page < ActiveRecord::Base
  belongs_to :user , dependent: :destroy
  validates :title , presence: true , length: {minimum: 3, maximum: 40}
  validates :description , presence: true , length: {minimum: 5, maximum: 400}
  validates :user_id , presence: true
end