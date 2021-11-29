class AccountController < ApplicationController
    before_action :authenticate_user!
    def index
        if current_user.is_admin
            @users = User.where(role_id: Role.customercare) .or(User.where(role_id: Role.complainer))
        else
            redirect_to root_path, notice: "Not Authorized"
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @user.destroy
        redirect_to account_index_path, notice: "Successfully Deleted."
    end

end
