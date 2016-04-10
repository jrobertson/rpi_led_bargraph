Gem::Specification.new do |s|
  s.name = 'rpi_led_bargraph'
  s.version = '0.2.1'
  s.summary = 'Controls an LED bar graph using a Raspberry Pi'
  s.authors = ['James Robertson']
  s.files = Dir['lib/rpi_led_bargraph.rb']
  s.add_runtime_dependency('rpi_led', '~> 0.1', '>=0.1.1')
  s.signing_key = '../privatekeys/rpi_led_bargraph.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/rpi_led_bargraph'
end
