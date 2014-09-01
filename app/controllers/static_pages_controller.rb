class StaticPagesController < ApplicationController

  def home
    @user = User.friendly.find('reltair')
  end

end
