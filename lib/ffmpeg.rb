require 'ffmpeg/class_methods'
require 'ffmpeg/main_options'
require 'ffmpeg/video_options'
require 'ffmpeg/ffmpeg_command'
require 'ffmpeg/helper_methods'

module FFMpeg
  include HelperMethods
  include MainOptions
  include VideoOptions
  
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
    FFMpegCommand << "-i #{from_file}"
    FFMpegCommand << "#{to_file[:to]}" unless to_file[:to].nil?
    begin
      yield if block_given?
    rescue Exception => exception
      Thread.current[:'method checking enabled'] = true
      raise exception
    end
  end
  
  #
  # Runs ffmpeg
  #
  def run
    execute_command FFMpegCommand.command(locate_ffmpeg)
  end
  
  private
  
  #
  # 
  #
  def method_checking_enabled?
    !Thread.current[:'method checking enabled']
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