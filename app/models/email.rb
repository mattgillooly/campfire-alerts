class Email < ActiveRecord::Base
  attr_accessible :body, :from, :subject

  validates :from, length: { maximum: 255 }
  validates :subject, length: { maximum: 255 }

  validates_presence_of :body, :from, :subject

  has_many :links

  def html_body
    return nil unless html?

    if body.starts_with?('&lt;')
      CGI.unescapeHTML(body)
    else
      body
    end
  end
end
