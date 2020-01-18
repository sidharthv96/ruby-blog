class ApplicationController < ActionController::Base
    include Pundit
    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected

    def admin_authenticate
        authorize current_user, :admin?
    end

    private

    def user_not_authorized(exception)
        redirect_to posts_path
    end

end
