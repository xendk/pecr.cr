require "./extract"
require "ecr/processor"

filename = ARGV[0]
partial = ARGV[1]
buffer_name = ARGV[2]

begin
  puts ECR.process_string(PECR.extract(filename, partial), filename, buffer_name)
rescue ex : File::Error
  STDERR.puts ex.message
  exit 1
end
