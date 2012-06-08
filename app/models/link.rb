class Link < ActiveRecord::Base
  attr_accessible :blurb, :source, :title, :url

  validates_presence_of :title, :url
end
