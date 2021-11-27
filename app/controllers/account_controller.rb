class AccountController < ApplicationController
    def index
        @users = User.all
    end
end
