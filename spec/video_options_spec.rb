require File.dirname(__FILE__) + '/spec_helper'

describe "FFMpeg Video Options" do
  before(:each) do
    @from_file, @to_file = "~/Desktop/test.avi", "~/Desktop/test2.avi"
    FFMpegCommand.clear
  end
  
  it "should set the resolution" do
    convert @from_file, :to => @to_file do
      resolution "vga"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -s vga")
  end
  
  it "should set the video bitrate" do
    convert @from_file, :to => @to_file do
      video_bitrate "200k"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -b 200k")
  end

  it "should set the number of video frames to record" do
    convert @from_file, :to => @to_file do
      video_frames 200
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -vframes 200")
  end

  it "should set framerate" do
    convert @from_file, :to => @to_file do
      framerate 24
    end

    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -r 24")
  end

  it "should set aspect ratio" do
    convert @from_file, :to => @to_file do
      aspect "4:3"
    end

    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -aspect 4:3")
  end

  it "should set size of top crop band" do
    convert @from_file, :to => @to_file do
      crop_top 20
    end

    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -croptop 20")
  end

  it "should set size of bottom crop band" do
    convert @from_file, :to => @to_file do
      crop_bottom 20
    end

    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -cropbottom 20")
  end

  it "should set size of left crop band" do
    convert @from_file, :to => @to_file do
      crop_left 20
    end

    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -cropleft 20")
  end

  it "should set size of right crop band" do
    convert @from_file, :to => @to_file do
      crop_right 20
    end

    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -cropright 20")
  end

  it "should set size of top pad band" do
    convert @from_file, :to => @to_file do
      pad_top 20
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -padtop 20")
  end

  it "should set size of bottom pad band" do
    convert @from_file, :to => @to_file do
      pad_bottom 20
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -padbottom 20")
  end

  it "should set size of left pad band" do
    convert @from_file, :to => @to_file do
      pad_left 20
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -padleft 20")
  end

  it "should set size of right pad band" do
    convert @from_file, :to => @to_file do
      pad_right 20
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -padright 20")
  end

  it "should set color for padded bands" do
    convert @from_file, :to => @to_file do
      pad_color "ffffff"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -padcolor ffffff")
  end

  it "should disable video encoding" do
    convert @from_file, :to => @to_file do
      disable_video
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -vn")
  end

  it "should set the bitrate tolerance" do
    convert @from_file, :to => @to_file do
      video_bitrate_tolerance "8000k"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -bt 8000k")
  end

  it "should set maximum bitrate" do
    convert @from_file, :to => @to_file do
      video_maximum_bitrate "1000k"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -maxrate 1000k")
  end

  it "should set minimum bitrate" do
    convert @from_file, :to => @to_file do
      video_minimum_bitrate "5000k"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -minrate 5000k")
  end

  it "should set buffer verifier size" do
    convert @from_file, :to => @to_file do
      video_buffer_size "2M"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -bufsize 2M")
  end

  it "should set the codec explicitly" do
    convert @from_file, :to => @to_file do
      video_codec "x264"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -vcodec x264")
  end

  it "should set same quality encoding flag" do
    convert @from_file, :to => @to_file do
      same_video_quality
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -sameq")
  end

  it "should set the pass number for encoding" do
    convert @from_file, :to => @to_file do
      video_pass 2
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -pass 2")
  end

  it "should set the logfile prefix for multi-pass encoding" do
    convert @from_file, :to => @to_file do
      video_pass_logfile "test"
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -passlogfile test")
  end

  it "should set that a new video stream is being added to the current output stream" do
    convert @from_file, :to => @to_file do
      new_video
    end
    
    FFMpegCommand.command("ffmpeg").should eql("ffmpeg -i #{@from_file} #{@to_file} -newvideo")
  end
end