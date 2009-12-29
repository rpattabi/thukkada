
class Duration
  attr_reader :akshara_kalam

  def initialize(akshara_kalam)
    @akshara_kalam = akshara_kalam
  end

  def to_s
    self.akshara_kalam
  end
end

DEFAULT_AKSHARA_KALAM = Duration.new('')
ONE_AKSHARA_KALAM = Duration.new(',')
TWO_AKSHARA_KALAM = Duration.new(';')
HALF_AKSHARA_KALAM = Duration.new('-')
QUARTER_AKSHARA_KALAM = Duration.new('--')
EIGTH_AKSHARA_KALAM = Duration.new('---')
SIXTEENTH_AKSHARA_KALAM = Duration.new('----')
