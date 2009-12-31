require 'factory'
require 'renderers/tamil'

note_buckets = Factory.instance.create_notes("p; pmr grs; n, pnsrn")
puts note_buckets.to_s

#require 'rubygems'
#require 'RMagick'
#include Magick

#canvas = ImageList.new
#canvas.new_image(1000, 1000, HatchFill.new('white', 'lightcyan2', 20))
#
#score = ImageList.new('./renderers/data/tamil/ni.png', './renderers/data/tamil/sa.png')
#score.append(false)
#
#canvas << score.append(false)
#canvas.flatten_images.write '/tmp/test.png'
##images.display
#exit

Tamil.new(note_buckets).render
exit