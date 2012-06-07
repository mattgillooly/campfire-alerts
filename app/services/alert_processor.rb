require 'google_alert'
require 'chatter'

class AlertProcessor

  def call(alert_html)
    Rails.logger.info "starting AlertProcessor"
    alert = GoogleAlert.new(alert_html)
    chatter = Chatter.new

    alert.results.each do |result|
      Rails.logger.info "Posting link: #{result}"
      chatter.post_link(result.to_s)
    end
    Rails.logger.info "finished posting links"
  end

end
