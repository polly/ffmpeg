module FFMpeg
  module VideoOptions
    #
    # Set frame size. The format is `wxh' (ffserver default = 160x128, ffmpeg default = same as source).
    # The following abbreviations are recognized:
    #
    #   'sqcif'
    #       128x96
    #   'qcif'
    #       176x144
    #   'cif'
    #       352x288
    #   '4cif'
    #       704x576
    #   'qqvga'
    #       160x120
    #   'qvga'
    #       320x240
    #   'vga'
    #       640x480
    #   'svga'
    #       800x600
    #   'xga'
    #       1024x768
    #   'uxga'
    #       1600x1200
    #   'qxga'
    #       2048x1536
    #   'sxga'
    #       1280x1024
    #   'qsxga'
    #       2560x2048
    #   'hsxga'
    #       5120x4096
    #   'wvga'
    #       852x480
    #   'wxga'
    #       1366x768
    #   'wsxga'
    #       1600x1024
    #   'wuxga'
    #       1920x1200
    #   'woxga'
    #       2560x1600
    #   'wqsxga'
    #       3200x2048
    #   'wquxga'
    #       3840x2400
    #   'whsxga'
    #       6400x4096
    #   'whuxga'
    #       7680x4800
    #   'cga'
    #       320x200
    #   'ega'
    #       640x350
    #   'hd480'
    #       852x480
    #   'hd720'
    #       1280x720
    #   'hd1080'
    #       1920x1080
    #
    def resolution(resolution)
      FFMpegCommand << "-s #{resolution}"
    end
    
    # Set the video bitrate in bit/s (default = 200 kb/s or '200k').
    def video_bitrate(bitrate)
      FFMpegCommand << "-vb #{bitrate}"
    end
    
    # Set the number of video frames to record.
    def video_frames(number)
      FFMpegCommand << "-vframes #{number}"
    end
    
    # Set frame rate (Hz value, fraction or abbreviation), (default = 25).
    def framerate(fps)
      FFMpegCommand << "-r #{fps}"
    end
    
    # Set aspect ratio (4:3, 16:9 or 1.3333, 1.7777).
    def aspect(aspect)
      FFMpegCommand << "-aspect #{aspect}"
    end

    # Set top crop band size (in pixels).
    def crop_top(size)
      FFMpegCommand << "-croptop #{size}"
    end

    # Set bottom crop band size (in pixels).
    def crop_bottom(size)
      FFMpegCommand << "-cropbottom #{size}"
    end

    # Set left crop band size (in pixels).
    def crop_left(size)
      FFMpegCommand << "-cropleft #{size}"
    end

    # Set right crop band size (in pixels).
    def crop_right(size)
      FFMpegCommand << "-cropright #{size}"
    end

    # Set top pad band size (in pixels).
    def pad_top(size)
      FFMpegCommand << "-padtop #{size}"
    end

    # Set bottom pad band size (in pixels).
    def pad_bottom(size)
      FFMpegCommand << "-padbottom #{size}"
    end

    # Set left pad band size (in pixels).
    def pad_left(size)
      FFMpegCommand << "-padleft #{size}"
    end

    # Set right pad band size (in pixels).
    def pad_right(size)
      FFMpegCommand << "-padright #{size}"
    end

    # Set color of padded bands. The value for padcolor is expressed as a six digit hexadecimal number where the first
    # two digits represent red, the middle two digits green and last two digits blue (default = 000000 (black)).
    def pad_color(color)
      FFMpegCommand << "-padcolor #{color}"
    end

    # Disable video recording.
    def disable_video
      FFMpegCommand << "-vn"
    end

    # Set video bitrate tolerance (in bits, default 4000k). Has a minimum value of: (target_bitrate/target_framerate).
    # In 1-pass mode, bitrate tolerance specifies how far ratecontrol is willing to deviate from the target average
    # bitrate value. This is not related to min/max bitrate. Lowering tolerance too much has an adverse effect on
    # quality.
    def video_bitrate_tolerance(tolerance)
      FFMpegCommand << "-bt #{tolerance}"
    end

    # Set max video bitrate (in bit/s). Requires -bufsize to be set.
    def video_maximum_bitrate(bitrate)
      FFMpegCommand << "-maxrate #{bitrate}"
    end

    # Set min video bitrate (in bit/s). Most useful in setting up a CBR encode:
    # ffmpeg -i myfile.avi -b 4000k -minrate 4000k -maxrate 4000k -bufsize 1835k out.m2v
    # It is of little use elsewise.
    def video_minimum_bitrate(bitrate)
      FFMpegCommand << "-minrate #{bitrate}"
    end

    # Set video buffer verifier buffer size (in bits).
    def video_buffer_size(size)
      FFMpegCommand << "-bufsize #{size}"
    end

    # `-vcodec codec'
    # Force video codec to codec. Use the copy special value to tell that the raw codec data must be copied as is.
    def video_codec(codec)
      FFMpegCommand << "-vcodec #{codec}"
    end

    # Use same video quality as source (implies VBR).
    def same_video_quality
      FFMpegCommand << "-sameq"
    end

    # Select the pass number (1 or 2). It is used to do two-pass video encoding. The statistics of the video are
    # recorded in the first pass into a log file (see also the option -passlogfile), and in the second pass that log
    # file is used to generate the video at the exact requested bitrate. On pass 1, you may just deactivate audio and
    # set output to null, examples for Windows and Unix:
    #
    # ffmpeg -i foo.mov -vcodec libxvid -pass 1 -an -f rawvideo -y NUL
    # ffmpeg -i foo.mov -vcodec libxvid -pass 1 -an -f rawvideo -y /dev/null
    def video_pass(index)
      FFMpegCommand << "-pass #{index}"
    end

    # Set two-pass log file name prefix to prefix, the default file name prefix is "ffmpeg2pass". The complete file
    # name will be `PREFIX-N.log', where N is a number specific to the output stream.
    def video_pass_logfile(prefix)
      FFMpegCommand << "-passlogfile #{prefix}"
    end

    # Add a new video stream to the current output stream.
    def new_video
      FFMpegCommand << "-newvideo"
    end
  end
end