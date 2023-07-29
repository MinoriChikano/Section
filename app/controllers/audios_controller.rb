class AudiosController < ApplicationController
  def index
    @audios = Audio.all
  end

  def new
    @audios = Audio.new
  end

  def create
    @audios = Audio.new
    if @audio.save
      redirect_to audios_path, notice: "ミュージックを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
end
