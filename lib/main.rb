require 'factory'

note_buckets = Factory.instance.create_notes("p; pmr grs n, pnsrn")
puts note_buckets.to_s

require 'rubygems'
require 'RMagick'
include Magick

test = ImageList.new("/tmp/thukkada_trial.png")
test.display
exit