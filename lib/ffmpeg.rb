require 'ffmpeg/class_methods'
require 'ffmpeg/main_options'
require 'ffmpeg/file_extensions'
require 'ffmpeg/video_options'
require 'ffmpeg/video_advanced_options'
require 'ffmpeg/audio_options'
require 'ffmpeg/ffmpeg_command'
require 'ffmpeg/helper_methods'
require 'ffmpeg/meta_data'

module FFMpeg
  include HelperMethods
  include MainOptions
  include VideoOptions
  include VideoAdvancedOptions
  include AudioOptions
  include MetaData
  
  #
  # When mixed into a class, extend  
  # it with the ClassMethods module
  #
  def self.included(klass)
    klass.extend ClassMethods
    
    #
    # Everytime a method is added to the
    # class, check for conflicts with existing
    # module methods
    #
    def klass.method_added(name)
      check_method(name) if method_checking_enabled?
    end
  end
  
  #
  # Sets up an FFmpegCommand for converting files:
  #
  #  convert "file1.ext", :to => "file2.ext" do
  #    seek       "00:03:00"
  #    duration   "01:10:00"
  #    resolution "800x600"
  #  end
  #
  def convert(from_file, to_file = {})
    @from_file = from_file
    FFMpegCommand << "-i #{from_file}"
    begin
      yield if block_given?
    rescue Exception => exception
      disable_method_checking!
      raise exception
    end
    
    build_output_file_name(from_file, to_file[:to]) do |file_name|
      FFMpegCommand << file_name
    end
  end
  
  #
  # Explicitly set ffmpeg path
  #
  def ffmpeg_path(path)
    @@ffmpeg_path = path
  end

  #
  # Runs ffmpeg
  #
  def run
    @@ffmpeg_path ||= locate_ffmpeg
    unless @@ffmpeg_path.empty?
      execute_command FFMpegCommand.command(@@ffmpeg_path)
    else
      $stderr.puts "Couldn't locate ffmpeg, try to specify an explicit path
                    with the ffmpeg_path(path) method"
    end
  end
  
  private
  
  def build_output_file_name(from_file, to_file)
    return if to_file.nil?
    if FileExtensions::EXT.include?(to_file.to_s)
      yield from_file.gsub(/#{File.extname(from_file)}$/, ".#{to_file}")
    else
      yield "#{to_file}"
    end
  end

  #
  # Checks if the thread local varialble 'method checking disabled'
  # is true or false
  #
  def method_checking_enabled?
    !Thread.current[:'method checking disabled']
  end
  
  #
  # Turns off the method checking functionality
  #
  def disable_method_checking!
    Thread.current[:'method checking disabled'] = true
  end

  #
  # Tries to locate the FFmpeg executable
  #
  def locate_ffmpeg
    ffmpeg_executable = %x[which ffmpeg].strip
  end
  
  #
  # Executes FFmpeg with the specified command
  #
  def execute_command(cmd)
    puts "Executing: #{cmd}}"
    %x[#{cmd}]
    puts $?.success?
  end
end
