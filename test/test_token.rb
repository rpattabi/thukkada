
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'token'

class TestToken < Test::Unit::TestCase
  def test_note
    assert_equal(true, Token.new('s').note?)
    assert_equal(true, Token.new('r').note?)
    assert_equal(true, Token.new('g').note?)
    assert_equal(true, Token.new('m').note?)
    assert_equal(true, Token.new('p').note?)
    assert_equal(true, Token.new('t').note?)
    assert_equal(true, Token.new('n').note?)

    assert_not_equal(true, Token.new('.').note?)
  end

  def test_octave
    assert_equal(true, Token.new('.').octave?)
    assert_equal(true, Token.new('..').octave?)
    assert_equal(true, Token.new("'").octave?)
    assert_equal(true, Token.new("''").octave?)

    assert_not_equal(true, Token.new('...').octave?)
  end

  def test_duration
    assert_equal(true, Token.new(',').duration?)
    assert_equal(true, Token.new(';').duration?)
    assert_equal(true, Token.new('-').duration?)
    assert_equal(true, Token.new('--').duration?)
    assert_equal(true, Token.new('---').duration?)
    assert_equal(true, Token.new('----').duration?)

    assert_not_equal(true, Token.new('n').duration?)
    assert_not_equal(true, Token.new('.').duration?)
  end

  def test_gap
    assert_equal(true, Token.new(' ').gap?)
    assert_equal(true, Token.new("\t").gap?)

    assert_not_equal(true, Token.new('~').gap?)
  end

  def test_bar
    assert_equal(true, Token.new('|').bar?)
    assert_equal(true, Token.new('||').double_bar?)
    
    assert_not_equal(true, Token.new('/').bar?)
    assert_not_equal(true, Token.new('//').double_bar?)
  end
end
