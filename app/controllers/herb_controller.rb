class HerbController < ApplicationController

  def index
    @herbs = Herb.all
  end

  def show
    @herb = Herb.find(params[:id])
  end

  def new
    @herb = Herb.new
  end

  def create
    @herb = Herb.create(herb_params)
    if @herb.valid?
      redirect_to herbs_path
    end
  end

  # keyword that will prohibit methods from being called outside the scope of this class
  private
  # strong params - data protections inside a request
  def herb_params
    params.require(:herb).permit(:name, :watered)
  end

end
