class Review < ActiveRecord::Base
validates_presence_of :score, :content

belongs_to :user
belongs_to :place
end
