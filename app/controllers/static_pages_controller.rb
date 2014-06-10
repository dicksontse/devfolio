class StaticPagesController < ApplicationController

  def home
    @users = User.take(5)
  end

end
