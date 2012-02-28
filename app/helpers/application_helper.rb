module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "MyLifeSpheres"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
	image_tag("logo.svg", :alt => "Sample App", :class => "round")
  end
end