require "./pecr"

one = "Hello"
io = IO::Memory.new
ECR.embed_partial "spec/simple.ecr", "first", io
puts io.to_s
