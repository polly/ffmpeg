module FFMpeg
  module MetaData
    EXIF_UTILITY = 'exiftool'
    
    #
    # Retrieves meta data from the file using exiftool, and returned in a hash
    # allowing for complex conversion rules.
    #
    #   video_bitrate "300k" if meta[:video_bitrate].to_f > 300
    #
    def meta
      if `which #{EXIF_UTILITY}`.empty?
        {}
      else
        @meta_data ||= `#{EXIF_UTILITY} #{@from_file}`.split("\n").inject({}) {|hash, element| 
          hash.merge(((split = element.split(':')) && split.first.strip.downcase.gsub(/[^a-zA-Z0-9]/, "_").to_sym) => (split.shift && split).join(':').strip)
        }
      end
    end
    
  end
end