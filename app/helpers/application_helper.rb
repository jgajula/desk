module ApplicationHelper
  def present_filter(id)
    session[:filter_id] == id ? "active" : ""
  end

  def present_nav(path)
    current_page?(path) ? "active" : ""
  end

  def available_labels(labels)
    @labels.reject {|l| labels.include? l }
  end
end
