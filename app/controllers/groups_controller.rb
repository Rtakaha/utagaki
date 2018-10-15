class GroupsController < ApplicationController
  def index
  end
  def show
  end
  def new
    @group = Group.new
  end
  def create
    @user = User.new(
        name: params[:name]
    )
    if @user.save
      flash[:notice] = "グループ登録が完了しました"
      redirect_to("/main")
    else
      render("groups/new")
    end
  end
end
