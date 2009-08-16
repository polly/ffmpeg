require File.dirname(__FILE__) + '/spec_helper'

describe "FFMpeg Video Advanced Options" do
  before(:each) do
    @from_file, @to_file = "~/Desktop/test.avi", "~/Desktop/test2.avi"
    FFMpegCommand.clear
  end
  
  it "should set the pixel format" do
    convert @from_file, :to => @to_file do
      pixel_format 'list'
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-pix_fmt list/)
  end

  it "should set the SwScaler flags" do
    convert @from_file, :to => @to_file do
      swscaler_flags 'flag'
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-sws_flags flag/)
  end

  it "should set the group of pictures size" do
    convert @from_file, :to => @to_file do
      group_of_pictures_size 200
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-g 200/)
  end

  it "should set to use only intra frames" do
    convert @from_file, :to => @to_file do
      use_only_intra_frames
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-intra/)
  end

  it "should set the discard threshold" do
    convert @from_file, :to => @to_file do
      video_discard_threshold 20
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-vdt 20/)
  end

  it "should set to use a fixed video quantizer scale" do
    convert @from_file, :to => @to_file do
      video_quantizer_scale 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-qscale 10/)
  end

  it "should set the minimum video quantizer scale" do
    convert @from_file, :to => @to_file do
      video_minimum_quantizer_scale 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-qmin 10/)
  end

  it "should set the maximum video quantizer scale" do
    convert @from_file, :to => @to_file do
      video_maximum_quantizer_scale 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-qmax 10/)
  end
  
  it "should set the maximum video quantizer difference" do
    convert @from_file, :to => @to_file do
      video_maximum_quantizer_difference 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-qdiff 10/)
  end

  it "should set the video quantizer scale blur" do
    convert @from_file, :to => @to_file do
      video_quantizer_scale_blur 0.6
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-qblur 0.6/)
  end

  it "should set the video quantizer scale compression" do
    convert @from_file, :to => @to_file do
      video_quantizer_scale_compression 0.7
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-qcomp 0.7/)
  end

  it "should set the minimum video lagrange factor" do
    convert @from_file, :to => @to_file do
      video_minimum_lagrange_factor 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-lmin 10/)
  end

  it "should set the maximum video lagrange factor" do
    convert @from_file, :to => @to_file do
      video_maximum_lagrange_factor 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-lmax 10/)
  end

  it "should set the minimum video macroblock quantizer scale" do
    convert @from_file, :to => @to_file do
      video_minimum_macroblock_scale 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-mblmin 10/)
  end

  it "should set the maximum video macroblock quantizer scale" do
    convert @from_file, :to => @to_file do
      video_maximum_macroblock_scale 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-mblmax 10/)
  end

  it "should set the initial complexity for single pass encoding" do
    convert @from_file, :to => @to_file do
      initial_complexity 5
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-rc_init_cplx 5/)
  end

  it "should set the qp factor between P-frames and B-frames" do
    convert @from_file, :to => @to_file do
      b_frame_factor 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-b_qfactor 10/)
  end

  it "should set the qp factor between P-frames and I-frames" do
    convert @from_file, :to => @to_file do
      i_frame_factor 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-i_qfactor 10/)
  end

  it "should set the qp offset between P-frames and B-frames" do
    convert @from_file, :to => @to_file do
      b_frame_offset 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-b_qoffset 10/)
  end

  it "should set the qp offset between P-frames and I-frames" do
    convert @from_file, :to => @to_file do
      i_frame_offset 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-i_qoffset 10/)
  end


  it "should set the rate control equation" do
    convert @from_file, :to => @to_file do
      rate_control_equation "tex^qComp"
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-rc_eq string/)
  end

  it "should set the rate control override" do
    convert @from_file, :to => @to_file do
      rate_control_override 10
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-rc_override 10/)
  end

  it "should set the motion estimation method" do
    convert @from_file, :to => @to_file do
      motion_estimation_method "hex"
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-me_method hex/)
  end

  it "should set the DCT algorithm" do
    convert @from_file, :to => @to_file do
      dct_algorithm 5
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-dct_algo 5/)
  end

  it "should set the IDCT algorithm" do
    convert @from_file, :to => @to_file do
      idct_algorithm 8
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-idct_algo 8/)
  end

  it "should set error resilience" do
    convert @from_file, :to => @to_file do
      error_resilience 2
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-er 2/)
  end

  it "should set error concealment" do
    convert @from_file, :to => @to_file do
      error_concealment 1
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-ec 1/)
  end

  it "should set to use B-frames" do
    convert @from_file, :to => @to_file do
      b_frames 15
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-bf 15/)
  end

  it "should set macroblock decision mode" do
    convert @from_file, :to => @to_file do
      macroblock_decision_mode 1
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-mbd 1/)
  end

  it "should use four motion vector by macroblock" do
    convert @from_file, :to => @to_file do
      use_four_motion_vector
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-4mv/)
  end

  it "should set to use data partitioning" do
    convert @from_file, :to => @to_file do
      use_data_partitioning
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-part/)
  end

  # `-bug param'
  #     Work around encoder bugs that are not auto-detected. 

  it "should set how strictly to follow standards" do
    convert @from_file, :to => @to_file do
      strictness 3
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-strict 3/)
  end

  it "should enable advanced intra coding" do
    convert @from_file, :to => @to_file do
      enable_advanced_intra_coding
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-aic/)
  end

  it "should enable unlimited motion vector" do
    convert @from_file, :to => @to_file do
      enable_unlimited_motion_vector
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-umv/)
  end

  it "should deinterlace pictures" do
    convert @from_file, :to => @to_file do
      deinterlace
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-deinterlace/)
  end

  it "should force interlacing support in encoder" do
    convert @from_file, :to => @to_file do
      interlacing_support
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-ilme/)
  end

  it "should calculate PSNR of compressed frames" do
    convert @from_file, :to => @to_file do
      calculate_psnr
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-psnr/)
  end

  it "should dump video coding statistic to log file" do
    convert @from_file, :to => @to_file do
      dump_video_statistics
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-vstats/)
  end

  it "should dump video statistics to named file" do
    convert @from_file, :to => @to_file do
      dump_video_statistics "video_stats.log"
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-vstats_file video_stats.log/)
  end

  # `-top n'
  #     top=1/bottom=0/auto=-1 field first 

  # `-dc precision'
  #     Intra_dc_precision. 

  # `-vtag fourcc/tag'
  #     Force video tag/fourcc. 

  it "should show QP histogram" do
    convert @from_file, :to => @to_file do
      show_qp_histogram
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-qphist/)
  end

  it "should set the video bitstream filter" do
    convert @from_file, :to => @to_file do
      video_bitstream_filter "dump_extra"
    end
    
    FFMpegCommand.command("ffmpeg").should match(/-vbsf dump_extra/)
  end
end
