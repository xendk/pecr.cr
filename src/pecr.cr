require "ecr"

# TODO: Write documentation for `Pecr`
module PECR
  VERSION = "0.1.0"

  macro embed(filename, io_name)
    {{ run("./process_partial", filename, io_name.id.stringify) }}
  end
end
