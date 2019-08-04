module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then 'fixed alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-error'
    when :alert then 'alert alert-error'
    end
  end

  def link_to_remote_modal(name, link_to_remote_options = {}, html_options = {})
    html_options.merge!({data: {toggle: 'modal', target: html_options[:modal_id] || '#modal', backdrop: 'static', keyboard: false}})
    link_to(name, link_to_remote_options, html_options)
  end

  def modal_tag(id, size = nil)
    size = " modal-#{size}" if size.present?

    content_tag(:div, class: 'modal fade', id: id, role: 'dialog', 'aria-labelledby' => 'myModalLabel', 'aria-hidden' => true) do
      content_tag(:div, class: "modal-dialog#{size}") do
        content_tag(:div, class: 'modal-content', id: 'modal_content') do

        end
      end
    end
  end

end
