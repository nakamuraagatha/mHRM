module ApplicationHelper
  def delete_link(url, options={})
    options = {
        :method => :delete,
        :data => {:confirm => t(:text_are_you_sure)}
    }.merge(options)

    link_to "<i class='fa fa-lg fa-trash-o'></i>".html_safe, url, options
  end
end
