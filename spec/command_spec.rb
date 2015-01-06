require 'spec_helper'

describe Cuesmash::Command do

  describe "when executing" do

    before(:each) do
      Cuesmash::Command.stub(:compile)
      Cuesmash::Command.stub(:parse){nil}
    end
  end

  # describe "when starting a compile" do
  #
  #   before(:each) do
  #     @mock = double(Cuesmash::Compiler)
  #     @mock.stub(:compile)
  #     Cuesmash::Compiler.stub(:new){@mock}
  #   end
  #
  #   it "should set the compilers scheme and tmp dir" do
  #     Cuesmash::Compiler.should_receive(:new).with("scheme", "/tmp")
  #     Cuesmash::Command.compile("scheme", "/tmp")
  #   end
  #
  #   it "should start compiling" do
  #     @mock.should_receive(:compile)
  #     Cuesmash::Command.compile("scheme", "/tmp")
  #   end
  # end

  describe "when updating the plist" do

    before(:each ) do
      @mock = double(Cuesmash::Plist)
      @mock.stub(:execute)
      Cuesmash::Plist.stub(:new){@mock}
    end

    it "should set the plists scheme" do
      Cuesmash::Plist.should_receive(:new).with("scheme", "/tmp")
      Cuesmash::Command.update_plist("scheme", "/tmp")
    end

    it "should execute the plist update" do
      @mock.should_receive(:execute)
      Cuesmash::Command.update_plist("scheme", "/tmp")
    end

    describe "when running the cucumber tests" do

      before(:each ) do
        @mock = double(Cuesmash::Cucumber)
        @mock.stub(:test)
        Cuesmash::Cucumber.stub(:new){@mock}
      end

      it "should set the cucumber tags" do
        Cuesmash::Cucumber.should_receive(:new).with("tags", anything, anything)
        Cuesmash::Command.run_tests(tags: "tags", profile: "profile", quiet: true)
      end

      it "should set the format" do
        @cucumber = Cuesmash::Cucumber.new
        Cuesmash::Cucumber.stub(:new){@cucumber}

        @cucumber.should_receive(:format=)
        Cuesmash::Command.run_tests(tags: nil, profile: nil, format: "format", quiet: anything)
      end

      it "should set the output" do
        @cucumber = Cuesmash::Cucumber.new
        Cuesmash::Cucumber.stub(:new){@cucumber}

        @cucumber.should_receive(:output=)
        Cuesmash::Command.run_tests(tags: nil, profile: nil, format: nil, output: "output", quiet: anything)
      end

      it "should start the tests" do
        @mock.should_receive(:test)
        Cuesmash::Command.run_tests(tags: "tags", profile: "profile", quiet: true)
      end

    end # describe "when running the cucumber tests"
  end # describe "when updating the plist"
end # describe Cuesmash::Command
