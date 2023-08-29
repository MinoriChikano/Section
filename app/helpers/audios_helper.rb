module AudiosHelper
  def add_url_reference_form(reference)
    if reference.present?
      "https://music.apple.com#{reference}"
    end
  end
end
