require 'redcarpet'

module MarkdownTemplates
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.markdown
    @_markdown ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      autolink:             true,
      space_after_headers:  false,
      fenced_code_blocks:   true,
      lax_spacing:          true
    )
  end

  def self.call(template)
    compiled_source = erb.call(template)
    "MarkdownTemplates.markdown.render(begin;#{compiled_source};end).html_safe"
  end
end

ActionView::Template.register_template_handler :md, :markdown, MarkdownTemplates
