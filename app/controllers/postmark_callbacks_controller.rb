class PostmarkCallbacksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    logger.info "received web hook from Postmark"

    email = Email.create!(subject: params['Subject'],
                          body: params['HtmlBody'],
                          from: params['From'])

    AlertProcessor.new.call(email.body)

    head :ok
  end

end
