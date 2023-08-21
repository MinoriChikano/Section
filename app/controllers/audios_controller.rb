class AudiosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_audio, only: [:show, :edit, :update, :destroy]
  before_action :other_user, only: [:edit, :update, :destroy]
  before_action :outsider, only: [:show, :edit, :update, :destroy]
  before_action :unauthorized_user, only: :index

  def index
    @project = Project.find(params[:project_id])
    @audios = @project.audios.page(params[:page]).per(4)
  end

  def new
    @project = Project.find(params[:project_id])
    @audio = Audio.new
  end

  def create
    @audio = current_user.audios.build(audio_params)
    @project = Project.find(params[:audio][:project_id])
    
    applemusic = params[:audio][:reference]
    applemusic.slice!(0,23)
    @audio.reference = applemusic

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
    redirect_to audios_path(project_id: @audio.project_id), notice: "削除しました"
  end

  def download
    audio = Audio.find(download_params[:id])
    file = audio.file
    send_data(file.read, filename: "#{audio.title}#{File.extname(file.path)}")
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :bpm, :key, :comment, :file, :reference, :project_id)
  end

  def download_params
    params.permit(:id)
  end

  def set_audio
    @audio = Audio.find(params[:id])
  end
  
  def outsider
    unless current_user.id == @audio.project.user.id || @audio.project.members.pluck(:id).include?(current_user.id) 
      flash[:notice] = "権限がありません"
      redirect_to audios_path(project_id: @audio.project_id)
    end
  end

  def unauthorized_user
    project = Project.find(params[:project_id])
    unless current_user == project.user || project.members.include?(current_user)
      flash[:alert] = "権限がありません"
      redirect_to projects_path
    end
  end

  def other_user
    unless current_user.id == @audio.user.id
      flash[:notice] = "権限がありません"
      redirect_to audios_path(project_id: @audio.project_id)
    end
  end
end
