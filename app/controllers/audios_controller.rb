class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update, :destroy]
  def index
    @audios = Audio.all
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(audio_params)
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

  def destroy
    @audio.destroy
    redirect_to audios_path, notice: "削除しました"
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :bpm, :key, :comment)
  end

  def set_audio
    @audio = Audio.find(params[:id])
  end
end
