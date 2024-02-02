module ArticlesHelper
  require 'redcarpet'
  require 'redcarpet/render_strip'

  def convert_markdown_into_html(text)
    # NOTE: https://qiita.com/hakuisan/items/acf6aee4771b570c80b9

    render_options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      strikethrough: true,
      superscript: true
    }

    renderer = Redcarpet::Render::HTML.new(render_options)
    # rubocop:disable Rails/OutputSafety
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
