module ResponsesHelper
  def add_url_audio_edit_form(reference)
    if reference.present?
      "https://music.apple.com#{reference}"
    end
  end
end
