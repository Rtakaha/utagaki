class UsersController < ApplicationController

  def login
    @user = User.find_by(email: params[:email] )
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/main")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("login")
    end
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
      redirect_to("/main")
    else
      render("users/new")
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

end
