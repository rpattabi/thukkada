
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'parser'

class TestParser < Test::Unit::TestCase
  def test_parse
    tokens = []
    Parser.new.parse("snt") { |token| tokens << token.to_s }
    assert_equal(['s','n','t'], tokens )

    tokens = []
    Parser.new.parse("sn,t") { |token| tokens << token.to_s }
    assert_equal(['s','n', ',', 't'], tokens )

    tokens = []
    Parser.new.parse("s[..]n,t") { |token| tokens << token.to_s }
    assert_equal(['s','..', 'n', ',', 't'], tokens )
    
    tokens = []
    Parser.new.parse("n,[;;] s.t s.ntp mgm, p,[;;]") { |token| tokens << token.to_s }
    assert_equal(['n',',',';;', ' ', 's','.','t', ' ', 's', '.', 'n', 't', 'p', ' ', 'm', 'g', 'm', ',', ' ', 'p', ',', ';;'],
                 tokens )
  end
end
