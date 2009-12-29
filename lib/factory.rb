require 'primitives/note'
require 'singleton'

class Factory
  include Singleton

  def create_note(notation)
    case notation
    when 's'
      Sa.new
    when 'r'
      Re.new
    when 'g'
      Ga.new
    when 'm'
      Ma.new
    when 'p'
      Pa.new
    when 't'
      Ta.new
    when 'n'
      Ni.new
    else
      NullNote.new
    end
  end

  def create_octave(notation)
    case notation
    when "'"
      TARA_STAYI
    when '.'
      MANDRA_STAYI
    end
  end

  def create_duration(notation)
    case notation
    when ','
      ONE_AKSHARA_KALAM
    when ';'
      TWO_AKSHARA_KALAM
    when '-'
      HALF_AKSHARA_KALAM
    end
  end

  def create_notes(notation)
    notated = [NoteBucket.new]
    current_note = NullNote.new

    notation.each_char do |ch|
      if note?(ch)
        current_note = self.create_note(ch)
        notated.last << current_note
      elsif octave?(ch)
        current_note.octave = self.create_octave(ch)
      elsif duration?(ch)
        current_note.duration << self.create_duration(ch)
      elsif gap?(ch)
        notated << ch
        notated << NoteBucket.new
      elsif bar?(ch)
        notated << self.create_bar(ch)
      end
    end

    notated
  end

  private

  def note?(ch)
    ch == 's' || ch == 'r' || ch == 'g' || ch == 'm' || ch == 'p' || ch == 't' || ch == 'n'
  end

  def octave?(ch)
    ch == "'" || ch == '.'
  end

  def duration?(ch)
    ch == ',' || ch == ';' || ch == '-'
  end

  def gap?(ch)
    ch == ' '
  end
end

