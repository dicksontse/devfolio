class StaticPagesController < ApplicationController

  def home
    @users = User.take(10)
  end

end
