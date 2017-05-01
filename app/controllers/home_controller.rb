class HomeController < ApplicationController
  def show
    @home = Home.new(current_user, params)
  end
end
