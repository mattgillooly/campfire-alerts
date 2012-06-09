class EmailsController < ApplicationController

  def index
    @emails = Email.order('created_at desc')
  end

  def show
    @email = Email.find(params[:id])
  end

end
