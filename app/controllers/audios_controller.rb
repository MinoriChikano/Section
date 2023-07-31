class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update]
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

  def update
    if @audio.update(audio_params)
      redirect_to audios_path, notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :bpm, :key, :comment)
  end

  def set_audio
    @audio = Audio.find(params[:id])
  end
end
