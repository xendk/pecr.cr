# PECR

PECR is an extension of `ECR` templates that supports partial
rendering.

PECR should be a drop-in replacement of ECR (please file an issue if
you discover this is not the case).

* `<% #partial my-partial -%>`: Start of partial named "my-partial"
* `<% #end -%>`: End of the current partial

These should be lines of their own, as the partial is currently
defined as starting on the line following the start tag, and ending on
the line before the end tag. The dashes in "-%>" are optional, but
suppresses any newlines when rendering the full template.

Rendering a partial is done by appending a hash and the name of the
partial to the file name:

``` crystal
PECR.render("file.ecr#partial")
```


## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     pecr:
       github: xendk/pecr
   ```

2. Run `shards install`

## Usage

```crystal
require "pecr"

PECR.render("file.ecr#partial")
```

## Contributing

1. Fork it (<https://github.com/xendk/pecr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Thomas Fini Hansen](https://github.com/xendk) - creator and maintainer
