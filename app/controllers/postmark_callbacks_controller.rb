class PostmarkCallbacksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    logger.info "received web hook from Postmark"
    AlertProcessor.new.call(params['HtmlBody'])
    head :ok
  end

end
