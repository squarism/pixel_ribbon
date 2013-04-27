# " Tell me and I forget, teach me and I may remember, involve me and I learn.""
# ― Benjamin Franklin

require 'faraday'
require 'nokogiri'

class Kuler

  def initialize
    # https://kuler-api.adobe.com/feeds/rss/get.cfm?timeSpan=30&listType=newest
    @http_client = Faraday.new(:url => 'https://kuler-api.adobe.com')
  end

  def get_theme
    response = @http_client.get '/feeds/rss/get.cfm?timeSpan=30&listType=newest'
    rss = Nokogiri::XML.parse response.body

    # cheap fake VCR test mode
    # rss = Nokogiri::XML.parse File.open('spec/rss.cache')

    theme = random_theme(rss)
    colors = parse_swatches(theme)
    {name: title(theme), colors: colors}
  end

  def random_theme xml
    item = xml.xpath('//item')[rand(20)]
  end

  def title theme
    theme.xpath('title').text.split(":")[1].strip
  end

  def parse_swatches theme
    swatches = theme.xpath('kuler:themeItem/kuler:themeSwatches/kuler:swatch')
    rgbs = swatches.collect {|s| s.xpath('kuler:swatchHexColor').text }
  end

end
