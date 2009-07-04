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
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -aframes 200")
  end

  it "should set sampling frequency" do
    convert @from_file, :to => @to_file do
      audio_sampling 22050
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -ar 22050")
  end

  it "should set bitrate" do
    convert @from_file, :to => @to_file do
      audio_bitrate "128k"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -ab 128k")
  end
  
  it "should set number of channels" do
    convert @from_file, :to => @to_file do
      audio_channels 2
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -ac 2")
  end

  it "should disable recording" do
    convert @from_file, :to => @to_file do
      disable_audio
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -an")
  end
  
  it "should set the codec explicitly" do
    convert @from_file, :to => @to_file do
      audio_codec "mp3"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -acodec mp3")
  end
  
  it "should set that a new audio stream is being added to the current output stream" do
    convert @from_file, :to => @to_file do
      new_audio
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -newaudio")
  end
  
  it "should set the language code" do
    convert @from_file, :to => @to_file do
      audio_language "eng"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -alang eng")
  end
end