require 'net/http'

class EsvBibleError < StandardError; end

class EsvBible
  VERSION = '0.0.1'
  BASE_URL = 'http://www.esvapi.org/v2/rest'
  VALID_FORMATS = [:plain_text, :html, :xml]
  VALID_HTML_OPTIONS = [:include_passage_references, :include_first_verse_numbers, 
      :include_verse_numbers, :include_headings, :include_subheadings, :include_footnotes, :include_footnote_links,
      :include_surrounding_chapters, :include_word_ids, :include_audio_link, :audio_format, :audio_version, 
      :include_copyright, :include_short_copyright]
  VALID_TEXT_OPTIONS = [:include_passage_references, :include_first_verse_numbers, 
      :include_verse_numbers, :include_headings, :include_subheadings, :include_selahs, 
      :include_passage_horizontal_lines, :include_heading_horizontal_lines, :include_footnotes, 
      :include_copyright, :include_short_copyright, :include_content_type, :line_length]
  VALID_XML_OPTIONS  = []

  attr_accessor :key
  
  class << self
    def formats
      VALID_FORMATS
    end
    
    def html_options
      VALID_HTML_OPTIONS
    end
    
    def text_options
      VALID_TEXT_OPTIONS
    end

    def xml_options
      VALID_XML_OPTIONS
    end    
  end
  
  def initialize(key = 'IP')
    @key = key
  end
  
  def passage(passage, options = {})
    cleanse! options
    url = build_url("passageQuery", options.merge(:passage => passage))
    open_bible(url)
  end
  
  def verse(verse, options = {})
    cleanse! options
    url = build_url("verse", options.merge(:passage => verse))
    open_bible(url)
  end
  
  def search(query, options = {})
    cleanse! options
    url = build_url("query", options.merge(:q => query))
    open_bible(url)
  end
  
  def build_url(action, options = {})
    url = "#{BASE_URL}/#{action}?"
    options.each_pair do |key, value|
      param = convert_to_param(key)
      url << "#{param}=#{value}&"
    end
    url << "key=#{self.key}"
  end

  def open_bible(url, limit = 10)
    raise EsvBibleError, 'HTTP redirect too deep' if limit == 0

    url = URI.escape(url)
    
    response = Net::HTTP.get_response(URI.parse(url))
    case response
      when Net::HTTPSuccess
        response.body
      when Net::HTTPRedirection
        open_passage(response['location'], limit - 1)
      else
        raise "#{rsp.code} #{rsp.message}"
    end
  end
  
  def cleanse! options
    format = options[:output_format] || :html
    raise EsvBibleError unless VALID_FORMATS.include?(format)
    
    valid_format_attributes = case format
    when :html        then VALID_HTML_OPTIONS
    when :plain_text  then VALID_TEXT_OPTIONS
    when :xml         then VALID_XML_OPTIONS
    end
    options.reject! { |key, value| !valid_format_attributes.include?(key) }
  end
  
  def convert_to_param(symbol)
    symbol.to_s.gsub('_', '-')
  end
  
end