require "ecr"

# TODO: Write documentation for `Pecr`
module PECR
  VERSION = "0.1.0"

  # TODO: Put your code here
end

module ECR
  macro embed_partial(filename, partial, io_name)
    \{{ run("./process_partial", {{filename}}, {{partial}}, {{io_name.id.stringify}}) }}
  end
end
