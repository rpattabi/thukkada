
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'primitives/duration'

class TestDuration < Test::Unit::TestCase
  def test_akshara_kalam
    assert_equal('', DEFAULT_AKSHARA_KALAM.to_s)
    assert_equal(',', ONE_AKSHARA_KALAM.to_s)
    assert_equal(';', TWO_AKSHARA_KALAM.to_s)
    assert_equal('-', HALF_AKSHARA_KALAM.to_s)
    assert_equal('--', QUARTER_AKSHARA_KALAM.to_s)
    assert_equal('---', EIGTH_AKSHARA_KALAM.to_s)
    assert_equal('----', SIXTEENTH_AKSHARA_KALAM.to_s)
  end
end
