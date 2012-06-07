class PostmarkCallbacksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    logger.info "received web hook from Postmark"

    email_body = CGI.unescapeHTML(params['HtmlBody'])

    email = Email.create!(subject: params['Subject'],
                          from: params['From'],
                          body: email_body)

    AlertProcessor.new.call(email.body)

    head :ok
  end

end
