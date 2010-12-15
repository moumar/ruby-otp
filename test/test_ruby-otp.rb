$:.unshift(File.dirname($0)+"/../lib")
require "otp"

require "test/unit"
require "yaml"

class OTPTest < Test::Unit::TestCase
  def test_all
    fixtures = YAML::load_file(File.dirname(__FILE__)+"/fixtures.yml")
    fixtures.each do |algo, expected_otps|
      expected_otps.each do |expected_otp|
	otp = OTP.new(expected_otp["seq_num"], expected_otp["seed"], expected_otp["passphrase"], algo)
	assert_equal expected_otp["sentence"], otp.to_s
      end
    end
  end

  def test_generate_seed
    10.times do
      assert_match(/^[a-z]{2}\d{4}$/, OTP.generate_seed)
    end
  end
end
