require File.dirname(__FILE__) + '/spec_helper'

describe "FFMpeg Audio Options" do
  before(:each) do
    @from_file, @to_file = "~/Desktop/test.avi", "~/Desktop/test2.avi"
    FFMpegCommand.clear
  end
  
  it "should set number of frames to record" do
    convert @from_file, :to => @to_file do
      audio_frames 200
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -aframes 200 #{@to_file}")
  end

  it "should set sampling frequency" do
    convert @from_file, :to => @to_file do
      audio_sampling 22050
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -ar 22050 #{@to_file}")
  end

  it "should set bitrate" do
    convert @from_file, :to => @to_file do
      audio_bitrate "128k"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -ab 128k #{@to_file}")
  end
  
  it "should set number of channels" do
    convert @from_file, :to => @to_file do
      audio_channels 2
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -ac 2 #{@to_file}")
  end

  it "should disable recording" do
    convert @from_file, :to => @to_file do
      disable_audio
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -an #{@to_file}")
  end
  
  it "should set the codec explicitly" do
    convert @from_file, :to => @to_file do
      audio_codec "mp3"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -acodec mp3 #{@to_file}")
  end
  
  it "should set that a new audio stream is being added to the current output stream" do
    convert @from_file, :to => @to_file do
      new_audio
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -newaudio #{@to_file}")
  end
  
  it "should set the language code" do
    convert @from_file, :to => @to_file do
      audio_language "eng"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} -alang eng #{@to_file}")
  end
end