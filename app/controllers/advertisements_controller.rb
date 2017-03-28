class AdvertisementsController < ApplicationController
  def index
    # all get's collection
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    # we call Advertisement.new to create a new instance of Advertisement.
    @advertisement = Advertisement.new

    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      # redirect user to advertisement if successfully saved
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      flash.no[:alert] = "There was an error, please try again"
      render :new
    end
  end
end
