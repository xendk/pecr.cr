require "./extract"
require "ecr/processor"

filename = ARGV[0]
buffer_name = ARGV[1]

begin
  path = Path[filename]
  parts = path.basename.split('#', 2)

  if parts.size == 2
    filename = (path.parent / parts[0]).to_s
    partial = parts[1]
    puts ECR.process_string(PECR.extract(filename, partial), filename, buffer_name)
  else
    puts ECR.process_file(filename, buffer_name)
  end
rescue ex : File::Error
  STDERR.puts ex.message
  exit 1
end
