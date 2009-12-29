# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'primitives/bar'

class TestBar < Test::Unit::TestCase
  def test_bar
    assert_equal('|', Bar.new.to_s)
  end

  def test_double_bar
    assert_equal('||', DoubleBar.new.to_s)
  end
end
