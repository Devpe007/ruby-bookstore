module ApplicationHelper
  def markdown(text)
    @markdown_rederer ||= Redcarpet::Render::HTML.new(markdown_options)
    @redcarpet ||= Redcarpet::Markdown.new(@markdown_rederer, markdown_extensions)
    @redcarpet.render(text).html_safe
  end

  private

  def markdown_options
    {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fanced_code_blocks: true
    }
  end

  def markdown_extensions
    {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true
    }
  end
end
