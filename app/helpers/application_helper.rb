module ApplicationHelper
  # Custom page titles helper
  def title(text)
    content_for :title, text
  end
end
