module ApplicationHelper
  def sidebar_active(sidebar_path)
    'c-active' if current_page?(sidebar_path)
  end

  def sidebar_c_show(path)
    if current_page?(path)
      'c-show'
    end
  end
end
