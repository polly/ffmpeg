module FFMpeg
  module ClassMethods
    def check_method(name)
      print_error_message_for name if method_defined? name
    end
    
    def method_defined?(name)
      FFMpeg.instance_methods.include?(name.to_s) || FFMpeg.instance_methods.include?(name.to_sym)
    end
    private :method_defined?
    
    def print_error_message_for(name)
      $stderr.puts "WARNING: Possible conflict with FFMpeg extension:" + 
                   "FFMpeg##{name} already exists and will be overwritten"
    end
    private :print_error_message_for
  end
end