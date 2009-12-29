
class Octave
  attr_reader :stayi

  def initialize(stayi)
    @stayi = stayi
  end

  def to_s
    self.stayi
  end
end

ANU_MANDRA_STAYI = Octave.new('..')
MANDRA_STAYI = Octave.new('.')
MADYA_STAYI = Octave.new('')
TARA_STAYI = Octave.new("'")
ATI_TARA_STAYI = Octave.new("''")
