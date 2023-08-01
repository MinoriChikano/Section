class ResponsesController < ApplicationController
  def create
    @audio = Audio.find(params[:audio_id])
    @response = @audio.responses.build(response_params)
    respond_to do |format|
      if @response.save
        format.html { redirect_to audio_path(@audio) }
      else
        format.html { redirect_to audio_path(@audio), notice: '投稿できませんでした'}
      end
    end
  end

  private

  def response_params
    params.require(:response).permit(:comment)
  end
end
