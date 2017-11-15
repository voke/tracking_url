require 'addressable/uri'

class UrlParser

  STRATEGY = {
    'pdt.tradedoubler.com' => /url\((.+?)\)/,
    'clk.tradedoubler.com' => /url=([^&]+)/,
    'click.adrecord.com' => /url=([^&]+)/,
    'track.adtraction.com' => /url=([^&]+)/,
    'ad.zanox.com' => /ULP=\[\[(.+?)\]\]/,
    'track.double.net' => /redirect=([^&]+)/,
    'track.webgains.com' => /wgtarget=([^&]+)/,
    'c.trackmytarget.com' => /r=([^&]+)/,
    'belboon.de' => /deeplink=([^&]+)/,
    'api.netb11.com' => /url=([^&]+)/, # netbooster
    'partner-ads.com' => /htmlurl=([^&]+)/,
    'tc.tradetracker.net' => /u=([^&]+)/
  }

  def initialize(url)
    @url = Addressable::URI.parse(url)
  end

  def host
    @url.host
  end

  def strategy
    strat = STRATEGY.keys.find do |domain|
      host.match(Regexp.escape(domain))
    end
    STRATEGY[strat]
  end

  def decode(url)
    if Addressable::URI.unencode(url) == url
      url
    else
      Addressable::URI.unencode(url)
    end
  end

  def self.parse(url)
    new(url).parse
  end

  def parse
    if strategy
      decode(@url.to_s.scan(strategy).flatten.join)
    else
      @url.to_s
    end
  end

end
