class Link < ActiveRecord::Base
  attr_accessible :blurb, :source, :title, :url, :email

  validates :source, length: { maximum: 255 }
  validates :title, length: { maximum: 255 }
  validates :url, length: { maximum: 1000 }

  validates_presence_of :title, :url

  belongs_to :email
end
