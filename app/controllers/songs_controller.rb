# require 'pry'
class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @artists = Artist.all
    @genres = Genre.all
  end

  def edit
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to songs_path
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    @song = Song.update(song_params)
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

end
