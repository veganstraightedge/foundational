class Icon
  class << self
    def for name, options = {}
      name = name.to_s.dasherize
      file = File.read("node_modules/bootstrap-icons/icons/#{name}.svg")
      doc  = Nokogiri::HTML::DocumentFragment.parse file

      svg = doc.at_css 'svg'
      svg['class'] += " " + options[:class] if options[:class].present?

      doc.to_html.html_safe
    end
  end
end
