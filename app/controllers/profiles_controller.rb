class ProfilesController < ApplicationController
    def new
        # form where a user fill out their own profile.
        @user = User.find(params[:user_id])
        @profile = @user.build_profile
    end
end