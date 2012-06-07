class Email < ActiveRecord::Base
  attr_accessible :body, :from, :subject

  validates_presence_of :body, :from, :subject
end
