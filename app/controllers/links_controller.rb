class LinksController < ApplicationController

  def index
    @links = Link.order('created_at desc')
  end

end
