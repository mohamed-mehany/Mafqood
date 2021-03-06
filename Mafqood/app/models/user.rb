class User < ActiveRecord::Base
  has_many :accounts
  has_many :telephones
  has_many :addresses
  has_many :finding_posts
  has_many :missing_posts
  has_many :finding_post_reports
  belongs_to :spammer

  accepts_nested_attributes_for :telephones, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates_presence_of :name, :email
  
  # Public: Defines a string equivalent for the User ActiveRecord.
  #
  # Examples
  #
  #   User.first
  #   # => "Mark Morcos"
  #
  # Returns the name of the user belonging to the ActiveRecord.
  def to_s
    name
  end
end
