class FindingPost < ActiveRecord::Base
  belongs_to :user
  has_one :location
  
  validates_presence_of :name, :description, :image, :age, :location_id, :gender
  #validates_inclusion_of :gender, in: [I18n.t("suspect_posts.male"), I18n.t("suspect_posts.female")]
  validates_inclusion_of :age, in: 0..140 
  #validates :contact_info,
            #numericality: { only_integer: true }, 
            #length: { is: 11 }	

  mount_uploader :image, ImageUploader

  def to_s
    name
  end
end
