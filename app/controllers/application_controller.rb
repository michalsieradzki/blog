class ApplicationController < ActionController::Base
  def check_user_role!
    # if user_signed_in?
    #   redirect_to root_url, notice: "Nie masz dostępu do tej akcji" unless current_user.email == "michal.sieradzki@mail.com"
    # end
  end
end
