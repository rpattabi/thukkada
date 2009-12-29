require 'primitives/duration'
require 'primitives/octave'

class Note
  attr_reader :swaram, :duration
  attr_accessor :octave

  def initialize(swaram, octave = MADYA_STAYI, duration = [DEFAULT_AKSHARA_KALAM])
    @swaram = swaram
    @octave, @duration = octave, duration
  end

  def to_s
    "#{self.swaram}#{self.octave.to_s}#{self.duration.to_s}"
  end

end

class NullNote < Note
  def initialize
    super('')
  end
end

class Sa < Note
  def initialize
    super('sa')
  end
end

class Re < Note
  def initialize
    super('re')
  end
end

class Ga < Note
  def initialize
    super('ga')
  end
end

class Ma < Note
  def initialize
    super('ma')
  end
end

class Pa < Note
  def initialize
    super('pa')
  end
end

class Ta < Note
  def initialize
    super('ta')
  end
end

class Ni < Note
  def initialize
    super('ni')
  end
end

