require 'rubygems'
require 'spec'
require File.dirname(__FILE__) + '/../lib/esv_bible'

describe 'Initializing and configuring ESV API' do
  it "should default to 'IP' key" do
    bible = EsvBible.new
    bible.key.should == 'IP'
  end
  
  it "should allow setting a key" do
    bible = EsvBible.new('TEST')
    bible.key.should == 'TEST'
  end  
end

describe 'Showing a passage' do
  before(:each) do
    @bible = EsvBible.new('TEST')
  end
  
  it "should retrieve a passage" do
    @bible.should_receive(:open_bible).with("http://www.esvapi.org/v2/rest/passageQuery?passage=Gen 1&key=TEST")
    @bible.passage 'Gen 1'
  end  
end

describe 'Showing a verse' do
  before(:each) do
    @bible = EsvBible.new('TEST')
  end
  
  it "should retrieve a verse" do
    @bible.should_receive(:open_bible).with("http://www.esvapi.org/v2/rest/verse?passage=Gen 1:1&key=TEST")
    @bible.verse 'Gen 1:1'
  end
end

describe 'Searching' do
  before(:each) do
    @bible = EsvBible.new('TEST')
  end
  
  it "search for a phrase" do
    @bible.should_receive(:open_bible).with("http://www.esvapi.org/v2/rest/query?q=Some phrase&key=TEST")
    @bible.search 'Some phrase'
  end
end

describe "The inner workings of the library" do
  before(:each) do
    @bible = EsvBible.new('TEST')
  end

  it "should convert symbols to strings for params" do
    @bible.convert_to_param(:symbol).should == 'symbol'
  end
  
  it "should convert symbol underscores to hyphens" do
    @bible.convert_to_param(:symbol_with_underscore).should == 'symbol-with-underscore'
  end
  
  it "should build the url for action" do
    @bible.build_url(:action).should include("http://www.esvapi.org/v2/rest/action?key=TEST")
  end

  it "should build the url for action and param" do
    @bible.build_url(:action, :q => 'value').should include("http://www.esvapi.org/v2/rest/action?q=value&key=TEST")
  end
  
  it "should build the url for action and multiple params" do
    @bible.build_url(:action, :q => 'value', :something => true).should include("http://www.esvapi.org/v2/rest/action?something=true&q=value&key=TEST")
  end
end