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

    styled_links = doc.css('a').select{|l| l['style']}

    alert_links = styled_links.select{|l| l['style'].match(/color:\s?#?1111[cC][cC]/) }

    alert_links.each do |link|
      desc = link.parent.at_css('font')
      source = desc.at_css('a')

      desc.css('a').each(&:remove)
      blurb = desc.content

      @results << Result.new(link[:href], link.content, source.try(:content), blurb)
    end
  end

end
