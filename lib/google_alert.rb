require 'nokogiri'

class GoogleAlert

  class Result < Struct.new(:link, :title, :source, :blurb)
    def to_s
      "#{title} #{link}"
    end
  end

  attr_reader :results

  def initialize(html)
    @results = []

    doc = Nokogiri::HTML(html)

    links = doc.css('a').select{|l| l['style'] == "color:#1111cc"}

    links.each do |link|
      desc = link.parent.at_css('font')
      source = desc.at_css('a')

      desc.css('a').each(&:remove)
      blurb = desc.content

      @results << Result.new(link[:href], link.content, source.try(:content), blurb)
    end
  end

end
