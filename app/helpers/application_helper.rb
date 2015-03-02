module ApplicationHelper
  def present_filter(id)
    session[:filter_id] == id ? "active" : ""
  end

  def present_nav(path)
    current_page?(path) ? "active" : ""
  end

  def available_labels(labels)
    all_labels = @labels[:entries].map{|l| l.name}
    all_labels.reject{|a| labels.include? a}
  end
end
