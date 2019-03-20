class PartiesController < ApplicationController

  def new
    @party = Party.new
    render :new
  end

  def create
    @party = Party.create(party_params)
    if @party.valid?
      redirect_to parties_path
    else
      render :new
    end
  end

  def index
    @parties = Party.all[1..Party.all.length]
    render :index
  end

  def show
    party_set
    render :show
  end

  def destroy
    party_set
    @party.unemployer
    @party.destroy
    redirect_to parties_path
  end
  #need to be able to draft party members

  def tinder
    party_set
    @character = Party.tinderable_characters.sample
    render :tinder
  end

  private
  def party_params
    params.require(:party).permit(:mission, :alignment)
  end
  def party_set
    @party = Party.find(params[:id])
  end

end
