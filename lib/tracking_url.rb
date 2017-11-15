require "tracking_url/version"
require "tracking_url/url_parser"

module TrackingUrl

  def self.parse_lp(url)
    UrlParser.parse(url)
  end

  def self.valid?(url)
    # TODO: Return true if this is a recognized tracking url
  end

end
