class WelcomeController < ApplicationController

  def index
    render text: "Welcome, #{current_user.name}"
  end
end
