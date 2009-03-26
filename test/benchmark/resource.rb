require 'rubygems'
require 'benchmark'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../lib'))
require 'blobber'

class Document; include Blobber::Resource; end

sample_size = ARGV[1] || 10000
document = Document.new(:name => "Sample Document")

puts "Resource Benchmark (sample size: #{sample_size})\n\n"
Benchmark.bm(10) do |x|
  x.report("create:   ") { for i in 1..sample_size; Document.new(:name => "Document").save; end }
  x.report("find:     ") { sample_size.times do; Document.find(document.key); end }
  x.report("save:     ") { sample_size.times do; document.save; end }
end
