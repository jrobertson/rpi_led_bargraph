# Introducing the rpi_led_bargraph gem

## Example

    require 'rpi_led_bargraph'

    g = RPiLedBarGraph.new(%w(26 19 13 6 5 11 20 16 4 12))

    # a quick self test
    g.on
    sleep 5
    g.off

    # using the bar graph as a progress meter, just enter a percentage
    g.progress 20, :blink
    sleep 2
    g.progress 40, :blink


## Options

Initialize options:

* wait: defaults to 0.1s for animating the illumination of bars for methods on() and off()
* dir: defaults to :ltr (left-to-right)
* invert: 0% progress will illuminate all LEDs, while 100% progress would turn all the LEDs off

Progress options:

* blink: by default it is set to false

## Resources

* rpi_led_bargraph https://rubygems.org/gems/rpi_led_bargraph

rpi raspberrypi led bargraph gem
