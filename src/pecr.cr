require "ecr"

# PECR is an extension of `ECR` templates that supports partial
# rendering.
#
# PECR should be a drop-in replacement of ECR (please file an issue if
# you discover this is not the case).
#
# * `<% #partial my-partial -%>`: Start of partial named "my-partial"
# * `<% #end -%>`: End of the current partial
#
# These should be lines of their own, as the partial is currently
# defined as starting on the line following the start tag, and ending
# on the line before the end tag. The dashes in "-%>" are optional,
# but suppresses any newlines when rendering the full temlpate.
#
# Rendering a partial is done by appending a hash and the name of the
# partial to the file name.
module PECR
  VERSION = "0.1.0"

  # Embeds an ECR file *filename* into the program and appends the content to
  # an IO in the variable *io_name*.
  #
  # Works like `ECR#embed`, but supports partial rendering. The
  # desired partial is specified by appending "#" and the partial name
  # to the filename.
  #
  # See `ECR#embed` for rendering details.
  macro embed(filename, io_name)
    {{ run("./process_partial", filename, io_name.id.stringify) }}
  end

  # Embeds an ECR file *filename* into the program and renders it to a string.
  #
  # Works like `ECR#render`, but supports partial rendering. The
  # desired partial is specified by appending "#" and the partial name
  # to the filename.
  #
  # See `ECR#render` for rendering details.
  macro render(filename)
    ::String.build do |%io|
      ::PECR.embed({{filename}}, %io)
    end
  end
end
