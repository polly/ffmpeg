# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ffmpeg}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrik Hedman"]
  s.date = %q{2009-08-16}
  s.description = %q{A DSL for building and executing ffmpeg commands}
  s.email = %q{patrik@moresale.se}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION.yml",
     "features/ffmpeg.feature",
     "features/steps/ffmpeg_steps.rb",
     "features/support/env.rb",
     "ffmpeg.gemspec",
     "lib/ffmpeg.rb",
     "lib/ffmpeg/audio_options.rb",
     "lib/ffmpeg/class_methods.rb",
     "lib/ffmpeg/ffmpeg_command.rb",
     "lib/ffmpeg/file_extensions.rb",
     "lib/ffmpeg/helper_methods.rb",
     "lib/ffmpeg/main_options.rb",
     "lib/ffmpeg/video_advanced_options.rb",
     "lib/ffmpeg/video_options.rb",
     "rdoc/classes/FFMpeg.html",
     "rdoc/classes/FFMpeg/AudioOptions.html",
     "rdoc/classes/FFMpeg/ClassMethods.html",
     "rdoc/classes/FFMpeg/HelperMethods.html",
     "rdoc/classes/FFMpeg/MainOptions.html",
     "rdoc/classes/FFMpeg/VideoOptions.html",
     "rdoc/classes/FFMpegCommand.html",
     "rdoc/classes/FileExtensions.html",
     "rdoc/created.rid",
     "rdoc/files/README_textile.html",
     "rdoc/files/lib/ffmpeg/audio_options_rb.html",
     "rdoc/files/lib/ffmpeg/class_methods_rb.html",
     "rdoc/files/lib/ffmpeg/ffmpeg_command_rb.html",
     "rdoc/files/lib/ffmpeg/file_extensions_rb.html",
     "rdoc/files/lib/ffmpeg/helper_methods_rb.html",
     "rdoc/files/lib/ffmpeg/main_options_rb.html",
     "rdoc/files/lib/ffmpeg/video_options_rb.html",
     "rdoc/files/lib/ffmpeg_rb.html",
     "rdoc/fr_class_index.html",
     "rdoc/fr_file_index.html",
     "rdoc/fr_method_index.html",
     "rdoc/index.html",
     "rdoc/rdoc-style.css",
     "spec/audio_options_spec.rb",
     "spec/ffmpeg_spec.rb",
     "spec/spec_helper.rb",
     "spec/video_advanced_options_spec.rb",
     "spec/video_options_spec.rb"
  ]
  s.homepage = %q{http://github.com/polly/ffmpeg}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{A dsl for building and executing ffmpeg commands}
  s.test_files = [
    "spec/audio_options_spec.rb",
     "spec/ffmpeg_spec.rb",
     "spec/spec_helper.rb",
     "spec/video_advanced_options_spec.rb",
     "spec/video_options_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
