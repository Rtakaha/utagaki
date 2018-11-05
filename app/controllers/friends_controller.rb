class FriendsController < ApplicationController


  def show
  end

  def create

    @friend = Friend.new(
        followfrom_id: current_user.id,
        followto_id: params[:user_id]
    )
    if @friend.save
      redirect_to("/users/#{params[:user_id]}")
    end
  end

  def destroy
    @friend = Friend.find_by(followfrom_id: current_user.id, followto_id: params[:user_id])
    @friend.destroy
    redirect_to("/users/#{params[:user_id]}")
  end
end
