# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :yard

require './lib/otp.rb'

Hoe.new('ruby-otp', OTP::VERSION) do |p|
  p.rubyforge_name = 'ruby-otp'
  p.author = 'Guillaume Pierronnet'
  p.email = 'moumar@rubyforge.org'
  p.summary = p.description = p.paragraphs_of('README.rdoc', 3).first
  p.url = p.paragraphs_of('README.rdoc', 1).first
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.remote_rdoc_dir = ''
  p.rdoc_locations << "rubyforge.org:/var/www/gforge-projects/ruby-otp/"
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
