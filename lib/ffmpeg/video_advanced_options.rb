module FFMpeg
  module VideoAdvancedOptions
    # Set pixel format. Use 'list' as parameter to show all the supported pixel formats.
    def pixel_format(format)
      FFMpegCommand << "-pix_fmt #{format}"
    end

    # Set SwScaler flags (only available when compiled with swscale support).
    def swscaler_flags(flags)
      FFMpegCommand << "-sws_flags #{flags}"
    end

    # Set the group of pictures size.
    def group_of_pictures_size(size)
      FFMpegCommand << "-g #{size}"
    end

    # Use only intra frames.
    def use_only_intra_frames
      FFMpegCommand << "-intra"
    end

    # Discard threshold.
    def video_discard_threshold(number)
      FFMpegCommand << "-vdt #{number}"
    end

    # Use fixed video quantizer scale (VBR).
    def video_quantizer_scale(scale)
      FFMpegCommand << "-qscale #{scale}"
    end

    # Use minimum video quantizer scale (VBR)
    def video_minimum_quantizer_scale(scale)
      FFMpegCommand << "-qmin #{scale}"
    end

    # Use maximum video quantizer scale (VBR)
    def video_maximum_quantizer_scale(scale)
      FFMpegCommand << "-qmax #{scale}"
    end

    #  Use maximum difference between the quantizer scales (VBR)
    def video_maximum_quantizer_difference(diff)
      FFMpegCommand << "-qdiff #{diff}"
    end    

    # Use video quantizer scale blur (VBR) (range 0.0 - 1.0)
    def video_quantizer_scale_blur(blur)
      FFMpegCommand << "-qblur #{blur}"
    end

    # Use video quantizer scale compression (VBR) (default 0.5). Constant of ratecontrol equation. Recommended range
    # for default rc_eq: 0.0-1.0 
    def video_quantizer_scale_compression(compression)
      FFMpegCommand << "-qcomp #{compression}"
    end

    # Use minimum video lagrange factor (VBR)
    #
    # This option uses 'lambda' units, but you may use the QP2LAMBDA constant to easily convert from 'q' units:
    #   ffmpeg -i src.ext -lmax 21*QP2LAMBDA dst.ext
    def video_minimum_lagrange_factor(lambda)
      FFMpegCommand << "-lmin #{lambda}"
    end

    # Use max video lagrange factor (VBR)
    #
    # This option uses 'lambda' units, but you may use the QP2LAMBDA constant to easily convert from 'q' units:
    #   ffmpeg -i src.ext -lmax 21*QP2LAMBDA dst.ext
    def video_maximum_lagrange_factor(lambda)
      FFMpegCommand << "-lmax #{lambda}"
    end

    # Use minimum macroblock quantizer scale (VBR)
    #
    # This option uses 'lambda' units, but you may use the QP2LAMBDA constant to easily convert from 'q' units:
    #   ffmpeg -i src.ext -lmax 21*QP2LAMBDA dst.ext
    def video_minimum_macroblock_scale(lambda)
      FFMpegCommand << "-mblmin #{lambda}"
    end

    # Use maximum macroblock quantizer scale (VBR).
    #
    # This option uses 'lambda' units, but you may use the QP2LAMBDA constant to easily convert from 'q' units:
    #   ffmpeg -i src.ext -lmax 21*QP2LAMBDA dst.ext
    def video_maximum_macroblock_scale(lambda)
      FFMpegCommand << "-mblmax #{lambda}"
    end

    # Use initial complexity for single pass encoding
    def initial_complexity(complexity)
      FFMpegCommand << "-rc_init_cplx #{complexity}"
    end

    # Use qp factor between P- and B-frames
    def b_frame_factor(factor)
      FFMpegCommand << "-b_qfactor #{factor}"
    end

    # Use qp factor between P- and I-frames
    def i_frame_factor(factor)
      FFMpegCommand << "-i_qfactor #{factor}"
    end

    # Use qp offset between P- and B-frames
    def b_frame_offset(offset)
      FFMpegCommand << "-b_qoffset #{offset}"
    end

    # Use qp offset between P- and I-frames
    def i_frame_offset(offset)
      FFMpegCommand << "-i_qoffset #{offset}"
    end

    # Set rate control equation (see section 3.11 FFmpeg formula evaluator) (default = tex^qComp).
    def rate_control_equation(equation)
      FFMpegCommand << "-rc_eq string"
    end

    # Set rate control override for specific intervals 
    def rate_control_override(override)
      FFMpegCommand << "-rc_override #{override}"
    end

    # Set motion estimation method to method. Available methods are (from lowest to best quality):
    # 
    #   `zero' - Try just the (0, 0) vector.
    #   `phods'
    #   `log'
    #   `x1'
    #   `hex'
    #   `umh'
    #   `epzs' - (default method)
    #   `full' - exhaustive search (slow and marginally better than epzs)
    def motion_estimation_method(method)
      FFMpegCommand << "-me_method #{method}"
    end

    # Set DCT algorithm to algo. Available values are:
    # 
    #   `0' FF_DCT_AUTO (default)
    #   `1' FF_DCT_FASTINT
    #   `2' FF_DCT_INT
    #   `3' FF_DCT_MMX
    #   `4' FF_DCT_MLIB
    #   `5' FF_DCT_ALTIVEC
    def dct_algorithm(algorithm)
      FFMpegCommand << "-dct_algo #{algorithm}"
    end

    # Set IDCT algorithm to algo. Available values are:
    # 
    #   `0' FF_IDCT_AUTO (default) 
    #   `1' FF_IDCT_INT 
    #   `2' FF_IDCT_SIMPLE 
    #   `3' FF_IDCT_SIMPLEMMX 
    #   `4' FF_IDCT_LIBMPEG2MMX 
    #   `5' FF_IDCT_PS2 
    #   `6' FF_IDCT_MLIB 
    #   `7' FF_IDCT_ARM 
    #   `8' FF_IDCT_ALTIVEC 
    #   `9' FF_IDCT_SH4 
    #   `10' FF_IDCT_SIMPLEARM 
    def idct_algorithm(algorithm)
      FFMpegCommand << "-idct_algo #{algorithm}"
    end

    # Set error resilience to n.
    # 
    #   `1' FF_ER_CAREFUL (default) 
    #   `2' FF_ER_COMPLIANT 
    #   `3' FF_ER_AGGRESSIVE 
    #   `4' FF_ER_VERY_AGGRESSIVE 
    def error_resilience(number)
      FFMpegCommand << "-er #{number}"
    end

    # Set error concealment to bit_mask. bit_mask is a bit mask of the following values:
    # 
    #   `1' FF_EC_GUESS_MVS (default = enabled) 
    #   `2' FF_EC_DEBLOCK (default = enabled)
    def error_concealment(mask)
      FFMpegCommand << "-ec #{mask}"
    end

    # Use 'frames' B-frames (supported for MPEG-1, MPEG-2 and MPEG-4).
    def b_frames(frames)
      FFMpegCommand << "-bf #{frames}"
    end

    # Macroblock decision mode
    # 
    #   `0' FF_MB_DECISION_SIMPLE: Use mb_cmp (cannot change it yet in FFmpeg). 
    #   `1' FF_MB_DECISION_BITS: Choose the one which needs the fewest bits. 
    #   `2' FF_MB_DECISION_RD: rate distortion 
    def macroblock_decision_mode(mode)
      FFMpegCommand << "-mbd #{mode}"
    end

    # Use four motion vector by macroblock (MPEG-4 only).
    def use_four_motion_vector
      FFMpegCommand << "-4mv"
    end

    # Use data partitioning (MPEG-4 only).
    def use_data_partitioning
      FFMpegCommand << "-part"
    end

    # `-bug param'
    #     Work around encoder bugs that are not auto-detected. 

    # How strictly to follow the standards.
    def strictness(strictness)
      FFMpegCommand << "-strict #{strictness}"
    end

    # Enable Advanced intra coding (h263+).
    def enable_advanced_intra_coding
      FFMpegCommand << "-aic"
    end

    # Enable Unlimited Motion Vector (h263+)
    def enable_unlimited_motion_vector
      FFMpegCommand << "-umv"
    end

    # Deinterlace pictures.
    def deinterlace
      FFMpegCommand << "-deinterlace"
    end    

    # Force interlacing support in encoder (MPEG-2 and MPEG-4 only). Use this option if your input file is interlaced
    # and you want to keep the interlaced format for minimum losses. The alternative is to deinterlace the input stream
    # with `-deinterlace', but deinterlacing introduces losses.
    def interlacing_support
      FFMpegCommand << "-ilme"
    end

    # Calculate PSNR of compressed frames.
    def calculate_psnr
      FFMpegCommand << "-psnr"
    end

    # Dump video coding statistics to `vstats_HHMMSS.log' or the supplied file.
    def dump_video_statistics(file = nil)
      unless file.nil?
        FFMpegCommand << "-vstats_file #{file}"
      else
        FFMpegCommand << "-vstats"
      end
    end

    # `-top n'
    #     top=1/bottom=0/auto=-1 field first 

    # `-dc precision'
    #     Intra_dc_precision. 

    # `-vtag fourcc/tag'
    #     Force video tag/fourcc. 

    # Show QP histogram.
    def show_qp_histogram
      FFMpegCommand << "-qphist"
    end

    # Bitstream filters available are "dump_extra", "remove_extra", "noise", "h264_mp4toannexb", "imxdump" and
    # "mjpegadump".
    def video_bitstream_filter(filter)
      FFMpegCommand << "-vbsf #{filter}"
    end
  end
end