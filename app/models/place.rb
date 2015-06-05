class Place < ActiveRecord::Base
  validates_presence_of :name, :phone, :website, :user_id, :address
  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def average_rating
    self.reviews.sum(:score) / self.reviews.size
  rescue ZeroDivisionError
    0
  end

  def self.search(search)
    if search
      where(['name LIKE ? OR address LIKE ?',"#{search}", "#{search}"])
    else
      all
    end
  end
end
