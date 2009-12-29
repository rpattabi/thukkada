# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'primitives/note'

class TestNote < Test::Unit::TestCase
  def test_swarams
    assert_equal('sa', Sa.new.swaram)
    assert_equal('re', Re.new.swaram)
    assert_equal('ga', Ga.new.swaram)
    assert_equal('ma', Ma.new.swaram)
    assert_equal('pa', Pa.new.swaram)
    assert_equal('ta', Ta.new.swaram)
    assert_equal('ni', Ni.new.swaram)
    assert_equal('', NullNote.new.swaram)
  end

  def test_octave
    assert_equal(MADYA_STAYI, Sa.new.octave)

    a_ma = Ma.new
    a_ma.octave = TARA_STAYI

    assert_equal(TARA_STAYI, a_ma.octave)
  end

  def test_duration
    assert_equal([DEFAULT_AKSHARA_KALAM], Ta.new.duration)

    a_ga = Ga.new
    assert_raise(NoMethodError) {a_ga.duration = DEFAULT_AKSHARA_KALAM}
    
    a_ga.duration << TWO_AKSHARA_KALAM
    assert_equal([DEFAULT_AKSHARA_KALAM, TWO_AKSHARA_KALAM], a_ga.duration)
  end

  def test_to_s
    assert_equal('sa', Sa.new.to_s)
    assert_equal('re', Re.new.to_s)
    assert_equal('ga', Ga.new.to_s)
    assert_equal('ma', Ma.new.to_s)
    assert_equal('pa', Pa.new.to_s)
    assert_equal('ta', Ta.new.to_s)
    assert_equal('ni', Ni.new.to_s)
    assert_equal('', NullNote.new.to_s)

    a_pa = Pa.new
    a_pa.octave = TARA_STAYI
    a_pa.duration << ONE_AKSHARA_KALAM
    assert_equal("pa',", a_pa.to_s)
  end
end
