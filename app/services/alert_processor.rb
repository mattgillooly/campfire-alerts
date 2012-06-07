require 'google_alert'
require 'chatter'

class AlertProcessor

  def call(alert_html)
    alert = GoogleAlert.new(alert_html)
    chatter = Chatter.new

    alert.results.each do |result|
      chatter.post_link(result.to_s)
    end
  end

end
