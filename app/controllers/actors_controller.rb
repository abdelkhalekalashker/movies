class ActorsController < ApplicationController
  def search
    @actors = Actor.where('name like ?', "%#{params[:query]}%")
  end
end
