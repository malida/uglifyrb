# encoding: UTF-8
require 'stringio'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Compressor" do
  it "minifies JS" do
    source = File.open("lib/test.js", "r:UTF-8").read
    minified = Uglifyrb::Compressor.new.compile(source)
    expect(minified.length).to be < source.length
    #expect { Uglifyrb::Compressor.new.compile(minified) }.not_to raise_error
  end
end
