module ApplicationHelper

  # Return title based on which page is accessed
  def title
    base_title = "Ardelyx Reference Navigator"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
