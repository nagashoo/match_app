class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
    @trainers = User.trainers
  end

  def show
    @trainer = User.find_by(id: params[:id])
  end

end
