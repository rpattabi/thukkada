
class Token
  def initialize(token)
    @token = token
  end

  def note?
    @token == 's' || @token == 'r' || @token == 'g' || @token == 'm' || @token == 'p' || @token == 't' || @token == 'n'
  end

  def octave?
    @token == "'" || @token == "''" || @token == '.' || @token == '..'
  end

  def duration?
    @token == ',' || @token == ';' || @token == '-' || @token == '--' || @token == '---' || @token == '----'
  end

  def gap?
    @token == ' ' || @token == "\t"
  end

  def bar?
    @token == '|'
  end

  def double_bar?
    @token == '||'
  end
  
  def to_s
    @token
  end
end
