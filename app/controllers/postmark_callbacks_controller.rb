class PostmarkCallbacksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    logger.info "received web hook from Postmark"

    email = Email.new(subject: params['Subject'],
                      from: params['From'])

    if params['HtmlBody'].present?
      email.body = params['HtmlBody']
      email.html = true
    else
      email.body = params['TextBody']
      email.html = false
    end

    logger.info "creating email: #{email.inspect}"

    email.save!

    AlertProcessor.new.call(email)

    head :ok
  end

end
