# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ffmpeg}
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrik Hedman"]
  s.date = %q{2009-07-03}
  s.description = %q{A DSL for building and executing ffmpeg commands}
  s.email = %q{patrik@moresale.se}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "ffmpeg.gemspec",
     "lib/ffmpeg.rb",
     "lib/ffmpeg/audio_options.rb",
     "lib/ffmpeg/class_methods.rb",
     "lib/ffmpeg/ffmpeg_command.rb",
     "lib/ffmpeg/helper_methods.rb",
     "lib/ffmpeg/main_options.rb",
     "lib/ffmpeg/video_options.rb"
  ]
  s.homepage = %q{http://github.com/polly/ffmpeg}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Need to write one}
  s.test_files = [
    "spec/audio_options_spec.rb",
     "spec/ffmpeg_spec.rb",
     "spec/spec_helper.rb",
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
