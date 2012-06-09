class Link < ActiveRecord::Base
  attr_accessible :blurb, :source, :title, :url, :email

  validates_presence_of :title, :url

  belongs_to :email
end
