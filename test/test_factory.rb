
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'factory'

class TestFactory < Test::Unit::TestCase
  def setup
    @factory = Factory.instance
    @panimapa = "pnmp"
    @rigari = "rgr rgr s,"
    @pa = "p; pmr grs n, pnsrn"
  end

  def test_instance
    assert_raise(NoMethodError) {Factory.new}
    assert_not_nil(@factory, Factory.instance)
  end

  def test_create_note
    assert_equal(Sa, @factory.create_note('s').class)
    assert_equal(Re, @factory.create_note('r').class)
    assert_equal(Ga, @factory.create_note('g').class)
    assert_equal(Ma, @factory.create_note('m').class)
    assert_equal(Pa, @factory.create_note('p').class)
    assert_equal(Ta, @factory.create_note('t').class)
    assert_equal(Ni, @factory.create_note('n').class)

    assert_equal(NullNote, @factory.create_note('ss').class)
    assert_equal(NullNote, @factory.create_note('').class)
  end

  def test_create_notes
    assert_equal("panimapa", @factory.create_notes(@panimapa).to_s)
    assert_equal("regare regare sa,", @factory.create_notes(@rigari).to_s)
    assert_equal("pa; pamare garesa ni, panisareni", @factory.create_notes(@pa).to_s)
  end
end
