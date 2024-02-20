
module PECR
  extend self

  def extract(filename, partial) : String
    String.build do |str|
      in_partial = false
      found = false

      File.each_line(filename, chomp: false) do |line|
        if !in_partial
          if /<%\s+#partial\s+([^ %]+)/ =~ line && $1 == partial
            in_partial = true
            found = true
          end
        else
          if /<%\s+#end/ =~ line
            in_partial = false
          else
            str << line
          end
        end

        break if found && !in_partial
      end

      raise "Partial not found" unless found
    end
  end
end
