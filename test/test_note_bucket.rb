
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'note_bucket'

class TestNoteBucket < Test::Unit::TestCase
  def test_add_note
    bucket = NoteBucket.new
    assert_nothing_thrown { bucket << Sa.new }

    assert_equal('sa', bucket.to_s)
  end
end
