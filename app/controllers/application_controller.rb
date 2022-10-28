class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_current_trainer

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def set_current_trainer
    @current_trainer = Trainer.find_by(id: session[:trainer_id])
  end

end
