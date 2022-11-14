class TrainersController < ApplicationController
  def index
    @trainers = User.trainers
  end

  def show
    @trainer = User.find_by(id: params[:id])
  end
end
