require "./spec_helper"
require "ecr"

describe PECR do
  it "full file embed works like ECR" do
    one = "Hello"
    two = "world"
    io = IO::Memory.new
    ECR.embed "spec/simple.ecr", io
    ecr = io.to_s
    io = IO::Memory.new
    PECR.embed "spec/simple.ecr", io

    io.to_s.should eq ecr
  end

  it "renders partals" do
    one = "Hello"
    io = IO::Memory.new
    PECR.embed "spec/simple.ecr#first", io
    io.to_s.should eq "Hello\n"
  end
end
