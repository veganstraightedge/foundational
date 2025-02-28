# TODO: move to /lib, because it's not business logic, it's generic subdomain/"upstreamable"
class Icon
  attr_reader :slug, :options

  class << self
    def for name, options = {}
      new(name, options).svg_tag
    end
  end

  def initialize name, options = {}
    @slug    = name.to_s.dasherize
    @options = options
  end

  def svg_tag
    svg_tag_class
    svg_tag_id
    svg_tag_size

    parsed_svg_file.to_html.html_safe
  end

  private

  def file
    # TODO: update this approach to use bootstrap gem instead
    File.read("node_modules/bootstrap-icons/icons/#{slug}.svg")
  end

  def parsed_svg_file
    @parsed_svg_file ||= Nokogiri::HTML::DocumentFragment.parse file
  end

  def svg
    @svg ||= parsed_svg_file.at_css 'svg'
  end

  def svg_tag_class
    svg['class'] += " #{options[:class]}" if options[:class].present?
  end

  def svg_tag_id
    svg['id'] = options[:id] if options[:id].present?
  end

  # rubocop:disable Metrics/AbcSize
  def svg_tag_size
    width, height = options[:size].split('x') if options[:size].present?

    svg['width']  = options[:width]  if options[:width].present?
    svg['height'] = options[:height] if options[:height].present?

    svg['width']  = width  if width.present?
    svg['height'] = height if height.present?
  end
  # rubocop:enable Metrics/AbcSize
end
