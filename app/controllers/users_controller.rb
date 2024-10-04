class UsersController < ApplicationController
  skip_before_action :require_authentication, only: %i[new]

  def new
  end
end
