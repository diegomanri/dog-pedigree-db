class PublicController < ApplicationController
  def index
  end

  def registration
    @user = User.new
  end
end
