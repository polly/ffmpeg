module FFMpeg
  module MainOptions
    
    def source(*filename)
      FFMpegCommand << "-i #{filename}"
    end
    
    def target(target)
      FFMpegCommand << "#{target}"
    end
    
    #
    # Overwrite output file if it already exists
    #
    def overwrite_existing_file
      FFMpegCommand.add_at("-y", 0)
    end
    
    #
    # Set the duration specified in seconds.
    # hh:mm:ss[.xxx] syntax is also supported
    #
    #   duration "600"
    #
    # or
    #
    #   duration "00:10:00"
    #
    def duration(duration)
      FFMpegCommand << "-t #{duration}"
    end
    
    #
    # Set a file size limit in bytes
    #
    #   file_size_limit 104_857_600
    #
    def file_size_limit(limit)
      FFMpegCommand << "-fs #{limit.to_s}"
    end
    
    #
    # Seek to given time position in seconds. 
    # hh:mm:ss[.xxx] syntax is also supported.
    #
    #   seek "600"
    #
    # or
    #
    #   seek "00:10:00"
    #
    def seek(position)
      FFMpegCommand << "-ss #{position}"
    end
    
    #
    # Set the input time offset in seconds. 
    # [-]hh:mm:ss[.xxx] syntax is also supported. 
    # This option affects all the input files that follow it. 
    # The offset is added to the timestamps of the input files. 
    # Specifying a positive offset means that the corresponding 
    # streams are delayed by 'offset' seconds.
    #
    #   offset "600"
    #
    # or
    #
    #   offset "00:10:00"
    #
    def offset(offset)
      FFMpegCommand << "-itsoffset #{offset}"
    end
    
    #
    # Set the title.
    #
    #   title "Some Title"
    #
    def title(title)
      FFMpegCommand << "-title '#{title}'"
    end
    
    #
    # Set the author.
    #
    #   author "PMH"
    #
    def author(author)
      FFMpegCommand << "-author '#{author}'"
    end
    
    #
    # Set the copyright.
    # 
    #   copyright "(c) Patrik Hedman 2009"
    #
    def copyright(copyright)
      FFMpegCommand << "-copyright '#{copyright}'"
    end
    
    #
    # Set the comment.
    #
    #   comment "Some comment"
    #
    def comment(comment)
      FFMpegCommand << "-comment '#{comment}'"
    end
    
    #
    # Set the album.
    #
    #   album "An awesome album"
    #
    def album(album)
      FFMpegCommand << "-album '#{album}'"
    end
    
    #
    # Set the track number:
    #
    #   track 1
    #
    def track(track)
      FFMpegCommand << "-track #{track}"
    end
    
    # 
    # Set the year.
    # 
    #   year 1985
    # 
    def year(year)
      FFMpegCommand << "-year #{year}"
    end
    
    #
    # Specify target file type ("vcd", "svcd", "dvd", "dv", "dv50", "pal-vcd", "ntsc-svcd", ... ). 
    # All the format options (bitrate, codecs, buffer sizes) are then set automatically.
    # Nevertheless you can specify additional options as long as you know they do not conflict 
    # with the standard.
    #
    #   target "vcd"
    #
    def target(target)
      FFMpegCommand << "-target #{target}"
    end
    
    #
    # Set the number of frames to record.
    #
    #   frames_to_record 50
    #
    def frames_to_record(frames)
      FFMpegCommand <<  "-dframes #{frames}"
    end
    
    #
    # Force subtitle codec ('copy' to copy stream)
    #
    def subtitle_codec(codec)
      FFMpegCommand << "-scodec #{codec}"
    end
  end
end