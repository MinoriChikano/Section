class ResponsesController < ApplicationController
  before_action :set_audio, only: [:create, :edit, :update]
  def create
    @audio = Audio.find(params[:audio_id])
    @response = @audio.responses.build(response_params)
    respond_to do |format|
      if @response.save
        format.js { render :index }
      else
        format.html { redirect_to audio_path(@audio), notice: '投稿できませんでした'}
      end
    end
  end

  def edit
    @response = @audio.responses.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @response = @audio.responses.find(params[:id])
      respond_to do |format|
        if @response.update(response_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def response_params
    params.require(:response).permit(:comment)
  end

  def set_audio
    @audio = Audio.find(params[:audio_id])
  end
end
