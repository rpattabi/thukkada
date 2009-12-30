require 'token'

GROUP_START = '['
GROUP_END = ']'

class Parser
  def parse(notation)
    is_in_group = false
    group = ''

    notation.each_char do |ch|
      if ch == GROUP_START
        is_in_group = true
        group = ''
      elsif ch == GROUP_END
        yield Token.new(group) if is_in_group
        is_in_group = false
      elsif is_in_group
        group += ch
      else
        yield Token.new(ch)
      end
    end
  end
end
