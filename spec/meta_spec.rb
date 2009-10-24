require File.dirname(__FILE__) + '/spec_helper'

describe "Video Meta Data" do

  before(:each) do
    @from_file = File.join(Dir.pwd, 'spec/files/terminal.mpg')
  end

  it "should get meta data" do
    convert @from_file, :to => :mp4 do
      meta[:file_name].should eql("terminal.mpg")
    end
  end
  
end