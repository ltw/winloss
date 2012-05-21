module ApplicationHelper
  def flash_messages_for(*types)
    types.map do |type|
      content_tag :div, {:class => "alert alert-block alert-#{type}"}, false do
        close_link = content_tag :a, raw('&times;'), {:class => 'close', :'data-dismiss' => 'alert'}
        close_link + content_tag(:div, flash[type], {:class => "container"}, false)
      end if flash[type].present?
    end.compact.join.html_safe
  end
end
