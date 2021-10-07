module ApplicationHelper
  def sidebar_active(controller)
    'c-active' if controller_name == controller
  end

  def sidebar_c_show(path)
    if current_page?(path)
      'c-show'
    end
  end
end
