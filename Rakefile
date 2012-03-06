# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :yard

Hoe.spec('ruby-otp') do |p|
  developer 'Guillaume Pierronnet', 'guillaume.pierronnet@gmail.com'
  self.readme_file = "README.rdoc"
  self.remote_rdoc_dir = ''
  self.rdoc_locations << "rubyforge.org:/var/www/gforge-projects/ruby-otp/"
  self.test_globs = ["test/test_*.rb"]
  self.rsync_args = "-rv --delete"
  self.extra_rdoc_files = FileList["*.rdoc"]
end

desc "generate the test fixtures"
task :generate_fixtures do
  require "yaml"

  fixtures = {}
  %w{md4 md5}.each do |algo|
    fixtures[algo] = []
    ['this is a pass', 'aqsdf234qsdf ,;:,sqdfp")q', 'eeazqsd123123123', 'sqdklmfvxcwvBU(/ysdfqsdf$' ].each do |passphrase|
      seq_num = rand(500) + 1
      seed = "fs9332"

      sentence = open("|opiekey -#{algo[-1].chr} -n 1 #{seq_num} #{seed} 2>/dev/null", "r+") do |io|
        io.puts(passphrase)
        io.read.chop
      end
      fixtures[algo] << { "seed" => seed, "seq_num" => seq_num, "passphrase" => passphrase, "sentence" => sentence  }
    end
  end
  File.open("test/fixtures.yml", "w") { |f| f.write(fixtures.to_yaml) }
end
# vim: syntax=ruby
