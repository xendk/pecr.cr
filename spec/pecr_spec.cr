require "./spec_helper"
require "ecr"

describe PECR do
  it "normal embed works" do
    one = "Hello"
    two = "world"
    io = IO::Memory.new
    ECR.embed "spec/simple.ecr", io
    io.to_s.should eq "Hello\nworld\n"
  end

  it "renders partals" do
    one = "Hello"
    io = IO::Memory.new
    ECR.embed_partial "spec/simple.ecr", "first", io
    io.to_s.should eq "Hello\n"
  end
end
