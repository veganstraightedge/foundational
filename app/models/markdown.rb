# TODO: move to /lib, because it's not business logic, it's generic subdomain/"upstreamable"
class Markdown
  class << self
    def render text
      return if text.blank?

      Kramdown::Document.new(
        text,
        input:                     :kramdown,
        remove_block_html_tags:    false,
        transliterated_header_ids: true
      ).to_html.html_safe.strip
    end
  end
end
