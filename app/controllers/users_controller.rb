class UsersController < ApplicationController

  def login

  end

  def login_form
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
        name: params[:name],
        email: params[:email],
        image_name: "default_user.jpg",
        password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

end
