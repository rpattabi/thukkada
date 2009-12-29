# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'primitives/octave'

class TestOctave < Test::Unit::TestCase
  def test_stayis
    assert_equal('..', ANU_MANDRA_STAYI.stayi)
    assert_equal('.', MANDRA_STAYI.stayi)
    assert_equal('', MADYA_STAYI.stayi)
    assert_equal("'", TARA_STAYI.stayi)
    assert_equal("''", ATI_TARA_STAYI.stayi)
  end

def test_to_s
    assert_equal('..', ANU_MANDRA_STAYI.to_s)
    assert_equal('.', MANDRA_STAYI.to_s)
    assert_equal('', MADYA_STAYI.to_s)
    assert_equal("'", TARA_STAYI.to_s)
    assert_equal("''", ATI_TARA_STAYI.to_s)
  end
end