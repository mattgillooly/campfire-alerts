require 'google_alerts'
require 'chatter'

class AlertProcessor

  def call(email)
    Rails.logger.info "starting AlertProcessor"
    search_results = GoogleAlerts.parse_email(email.html_body)
    chatter = Chatter.new

    search_results.each do |result|
      Rails.logger.info "Posting link: #{result}"

      Link.create!(
        url: result.link,
        title: result.title,
        source: result.source,
        blurb: result.blurb,
        email: email
      )

      chatter.post_link(result.to_s)
    end
    Rails.logger.info "finished posting links"
  end

end
