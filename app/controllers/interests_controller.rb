class InterestsController < ApplicationController

  def create
    @interest = Interest.new(user_id: @current_user.id, trainer_id: params[:trainer_id])
    @interest.save
    redirect_to("/trainers/index")
  end
end