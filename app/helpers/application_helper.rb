module ApplicationHelper
def nav_link(text, path, model)
    content_tag(:td, link_to(text, path), class: ('active' if controller.controller_name == model))
  end
end
