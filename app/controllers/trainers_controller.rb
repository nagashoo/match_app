class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find_by(id: params[:id])
  end

  def new
    @tainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(
      name: params[:name], 
      email: params[:email], 
      image_name: "default_tariner.jpg"
    )
    @trainer.name = params[:name]
    @trainer.email = params[:email]
    if @trainer.save
      flash[:notice] = "ユーザー登録を完了しました"
      redirect_to("/trainers/#{@trainer.id}")
    else
      render("trainers/new")
    end
  end

  def edit
    @trainer = Trainer.find_by(id: params[:id])
  end

  def update
    @trainer = Trainer.find_by(id: params[:id])
    @trainer.name = params[:name]
    @trainer.email = params[:email]
    if params[:image]
      @trainer.image_name = "#{@trainer.id}.jpg"
      image = params[:image]
      File.binwrite("public/trainer_images/#{@trainer.image_name}", image.read)
    end
    if @trainer.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/trainers/#{@trainer.id}")
    else
      render("trainers/edit")
    end
  end

  def login_form
  end

  def login
    @trainer = Trainer.find_by(email: params[:email], password: params[:password])
    if @trainer
      session[:user_id] = @trainer.id
      flash[:success] = "ログインしました"
      redirect_to("/users/#{@trainer.id}")
    else
      @error_messsage = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:passowrd]
      render("trainers/login_form")
    end
  end

  def logout
  end
end
