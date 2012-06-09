class PostmarkCallbacksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    logger.info "received web hook from Postmark"

    email = Email.new(subject: params['Subject'],
                      from: params['From'],
                      body: params['HtmlBody'])

    logger.info "creating email: #{email.inspect}"

    email.save!

    AlertProcessor.new.call(email)

    head :ok
  end

end
