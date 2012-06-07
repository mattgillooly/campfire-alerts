class PostmarkCallbacksController < ApplicationController

  def create
    AlertProcessor.new.call(params['HtmlBody'])
    head :ok
  end

end
