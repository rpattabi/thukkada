require 'primitives/note'
require 'note_bucket'
require 'parser'

require 'singleton'

#TODO Pretty print

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
    note_buckets = [NoteBucket.new]
    current_note = NullNote.new

    Parser.new.parse(notation) do |token|
      if token.note?
        current_note = self.create_note(token.to_s)
        note_buckets.last << current_note
      elsif token.octave?
        current_note.octave = self.create_octave(token.to_s)
      elsif token.duration?
        current_note.duration << self.create_duration(token.to_s)
      elsif token.gap?
        note_buckets << token.to_s
        note_buckets << NoteBucket.new
      elsif token.bar?
        note_buckets << self.create_bar(token.to_s)
      end
    end

    note_buckets
  end

end

