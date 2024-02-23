require "./spec_helper"
require "ecr"

private class PECRSpecPartialView
  @two = "Here"

  PECR.def_to_s "spec/class.ecr#second"
end

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
    io.to_s.should eq "Hello" + EOL
  end

  it "does .render" do
    one = "World"
    PECR.render("spec/simple.ecr#first").should eq "World" + EOL
  end

  it "does .def_to_s" do
    view = PECRSpecPartialView.new
    view.to_s.should eq "Here" + EOL
  end
end
