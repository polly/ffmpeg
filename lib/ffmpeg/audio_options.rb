module FFMpeg
  module AudioOptions
    # Set the number of audio frames to record.
    def audio_frames(number)
      FFMpegCommand << "-aframes #{number}"
    end

    # Set the audio sampling frequency (default = 44100 Hz).
    def audio_sampling(frequency)
      FFMpegCommand << "-ar #{frequency}"
    end

    # Set the audio bitrate in bit/s (default = 64k).
    def audio_bitrate(bitrate)
      FFMpegCommand << "-ab #{bitrate}"
    end

    # Set the number of audio channels (default = 1).
    def audio_channels(number)
      FFMpegCommand << "-ac #{number}"
    end

    # Disable audio recording.
    def disable_audio
      FFMpegCommand << "-an"
    end

    # Force audio codec to codec. Use the copy special value to specify that the raw codec data must be copied as is.
    def audio_codec(codec)
      FFMpegCommand << "-acodec #{codec}"
    end

    # Add a new audio track to the output file. If you want to specify parameters, do so before -newaudio (-acodec,
    # -ab, etc..). Mapping will be done automatically, if the number of output streams is equal to the number of input
    # streams, else it will pick the first one that matches. You can override the mapping using -map as usual. Example:
    #
    # ffmpeg -i file.mpg -vcodec copy -acodec ac3 -ab 384k test.mpg -acodec mp2 -ab 192k -newaudio
    def new_audio
      FFMpegCommand << "-newaudio"
    end

    # Set the ISO 639 language code (3 letters) of the current audio stream.
    def audio_language(code)
      FFMpegCommand << "-alang #{code}"
    end
  end
end