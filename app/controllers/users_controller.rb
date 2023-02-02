class UsersController < ApplicationController

    def resend_invitation 
      @user = User.find(params[:id])
      if @user.created_by_invite? && @user.invitation_accepted? == false
        @user.invite!
        redirect_to users_path, notice: "User re-invited"
      else
        redirect_to users_path, alert: "User is already active"
      end       
    end

end
