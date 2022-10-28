class InterestsController < ApplicationController

  def create
    @interest = Interest.new(user_id: @current_user.id, trainer_id: params[:trainer_id])
    @interest.save
    redirect_to("/trainers/index")
  end

  def destroy
    @interest = Interest.find_by(user_id: @current_user.id, trainer_id: params[:trainer_id])
    @interest.destroy
    redirect_to("/trainers/#{params[:trainer_id]}")
  end

end
