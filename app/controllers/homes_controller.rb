class HomesController < ApplicationController
  before_action :set_home, only: []
  respond_to :html, :xml, :json

  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all
    render :json => @homes
  
  end

  def as_json(options={})
    super(:only => [:title,:description],:include =>[:description])
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:title, :description)
    end
end
