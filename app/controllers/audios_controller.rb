class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @project = Project.find(params[:project_id])
    @audios = @project.audios
  end

  def new
    @project = Project.find(params[:project_id])
    @audio = Audio.new
  end

  def create
    @audio = current_user.audios.build(audio_params)
    if @audio.save
      redirect_to audios_path(project_id: @audio.project_id), notice: "ミュージックを作成しました"
    else
      render :new
    end
  end

  def show
    @responses = @audio.responses
    @response = @audio.responses.build
  end

  def edit
  end

  def update
    if @audio.update(audio_params)
      redirect_to audios_path(project_id: @audio.project_id), notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @audio.destroy
    redirect_to audios_path(project_id: @audio.project_id), notice: "編集しました"
  end

  def download
    audio = Audio.find(download_params[:id])
    file = audio.file
    send_data(file.read, filename: "download#{File.extname(file.path)}")
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :bpm, :key, :comment, :file, :project_id)
  end

  def download_params
    params.permit(:id)
  end

  def set_audio
    @audio = Audio.find(params[:id])
  end
end
