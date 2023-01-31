class UsersController < ApplicationController
  def my_portfolio
    @user = current_user #current-user is avialable throw devise
  end
end
