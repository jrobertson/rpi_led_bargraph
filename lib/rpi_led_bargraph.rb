#!/usr/bin/env ruby

# file: rpi_led_bargraph.rb

require 'rpi'


class RPiLedBarGraph < RPi

  def initialize(pins, wait: 0.1, dir: :ltr, invert: false)
    super pins
    @wait, @dir, @invert = wait, dir, invert
  end

  def on
    a = @dir == :ltr ? pins : pins.reverse
    a.each {|x| x.on; sleep @wait}
    :on
  end

  def off
    a = @dir == :ltr ? pins.reverse : pins
    a.each {|x| x.off; sleep @wait}
    :off
  end

  def inspect()
    'done'
  end

  # input % from 0-100
  #
  def level(n, state=nil, blink: false)

    blink = state if state == :blink

    upper = pins.length / (100.0 / n) - 1
    upper = pins.length - upper - 1 if @invert
    
    a = @dir == :ltr ? pins : pins.reverse
    a.each(&:off)
    sleep 0.3 if blink
    a[0..(upper).to_i].each(&:on)
    
    a[upper].blink if blink

  end

  alias progress level

end
