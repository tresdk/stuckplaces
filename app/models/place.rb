class Place < ActiveRecord::Base
  validates_presence_of :name, :phone, :website, :user_id, :address
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  has_many :reviews, dependent: :destroy
end
