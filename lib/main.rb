require 'factory'

note_buckets = Factory.instance.create_notes("p; pmr grs n, pnsrn")
puts note_buckets.to_s
