class UsersController < ApplicationController
  def index
    @users = User.trainees
  end

  def show
    @user = User.find_by(id: params[:id])
    @relationship = Relationship.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image_name = "default_user.jpg"

    if @user.save
      flash[:success] = "ユーザー登録を完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.location = params[:location]
    @user.gender = params[:gender]
    @user.age = params[:age] 
    @user.profile = params[:profile]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.saveg
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/")
  end

  def login_form; end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_messsage = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:passowrd]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to("/login")
  end

  def interests
    @user = User.find_by(id: params[:id])
    @interests = Interest.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :is_trainer)
  end
end
