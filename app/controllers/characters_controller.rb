class CharactersController < ApplicationController
  def show
    set_character_by_id
    render :show
  end

  def index
    @characters = Character.all
    render :index
  end

  def new
    #byebug
    @character = Character.new
    render :new
  end

  def create
    character = Character.create(character_params)
    if character.valid?
      redirect_to parties_path
    else
      #to refactor later
      @character = Character.new(character_params)
      flash[:errors] = character.errors.full_messages
      render :new
    end
  end

  def edit
    set_character_by_id
    render :edit
  end

  def update
    character = Character.new(character_params)
    if character.valid?
      Character.update(params[:id],character_params)
      redirect_to characters_path
    else
      set_character_by_id
      flash[:errors] = character.errors.full_messages
      render :edit
    end
  end

  def draft_or_fire
    character = Character.find(params[:id2])
    if character.party_id == params[:id].to_i
      character.update(party_id: Party.unemployed_id)
      redirect_to (party_path(params[:id]))
    else
      character.update(party_id: params[:id])
      redirect_to (party_path(params[:id]))
    end
  end

  def kill_unkill
    set_character_by_id
    @character.update(alive: !@character.alive)
    redirect_to character_path(@character)
  end

  def destroy
    set_character_by_id
    @character.destroy
    render :index
  end

  private
  def set_character_by_id
    @character = Character.find(params[:id])
  end
  def character_params
    params.require(:character).permit(:name, :char_class, :race, :level, :image_url, :party_id)
  end
end
