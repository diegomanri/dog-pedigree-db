class PublicController < ApplicationController

  layout 'application'

  def index
  end

  def registration
    @user = User.new
  end
end
