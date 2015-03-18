class Missing < ActiveRecord::Base

attr_accessor :image
# mount_uploader :image, ImageUploader

validates :gender , presence: true
validates :age , presence: true
validates :location , presence: true
validates :reporter_name , presence: true
validates :reporter_phone , presence: true
validates :descrpition , presence: true
validates :description, :special_signs,
          :length => { :maximum => 500 }

end
