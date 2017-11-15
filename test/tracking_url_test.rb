require 'test_helper'

class TrackingUrlTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::TrackingUrl::VERSION
  end

  def test_tradedoubler
    url = "https://clk.tradedoubler.com/click?p=123&a=123&g=123&url=https://example.com/"
    assert_equal TrackingUrl.parse_lp(url), "https://example.com/"
  end

  def test_webgains
    url = "http://track.webgains.com/click.html?wgcampaignid=123&wgprogramid=123&product=1&wglinkid=123&wgtarget=http://www.example.com?sClickID=webgains-4"
    assert_equal TrackingUrl.parse_lp(url), "http://www.example.com?sClickID=webgains-4"
  end

  def test_tradetracker
    url = 'http://tc.tradetracker.net/?c=123&m=12&a=123&r=foo&u=https://example.com'
    assert_equal TrackingUrl.parse_lp(url), 'https://example.com'
  end

  def test_partnerads
    url = 'https://www.partner-ads.com/dk/klikbanner.php?partnerid=123&bannerid=123&uid=foo&htmlurl=https://example.com'
    assert_equal TrackingUrl.parse_lp(url), 'https://example.com'
  end

  def test_double
    url = 'http://track.double.net/click/?channel=123&program=123&redirect=https%3A%2F%2Fwww.example.com'
    assert_equal TrackingUrl.parse_lp(url), 'https://www.example.com'
  end

  def test_zanox
    url = 'http://ad.zanox.com/ppc/?123&ULP=[[https%3A%2F%2Fwww.example.com]]'
    assert_equal TrackingUrl.parse_lp(url), 'https://www.example.com'
  end

  def test_netbooster
    url = 'https://api.netb11.com/c/?id=123&cd=123&subid1=foo&url=https://www.example.com'
    assert_equal TrackingUrl.parse_lp(url), 'https://www.example.com'
  end

  def test_adrecord
    url = 'http://click.adrecord.com/?p=123&c=123&url=http%3A%2F%2Fwww.example.com%2Fproduct.html'
    assert_equal TrackingUrl.parse_lp(url), 'http://www.example.com/product.html'
  end

  def test_adtraction
    url = 'http://track.adtraction.com/t/t?a=123&as=123&t=2&tk=1&url=http://www.example.com/'
    assert_equal TrackingUrl.parse_lp(url), 'http://www.example.com/'
  end

  def test_targetcircle
    url = 'http://c.trackmytarget.com/va5272?ref1=foo&r=https://www.example.com'
    assert_equal TrackingUrl.parse_lp(url), 'https://www.example.com'
  end

  def test_belboon
    url = 'https://www1.belboon.de/adtracking/123.html/&deeplink=https://www.dressinn.com?product=1'
    assert_equal TrackingUrl.parse_lp(url), 'https://www.dressinn.com?product=1'
  end

end
