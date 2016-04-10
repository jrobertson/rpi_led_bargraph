#!/usr/bin/env ruby

# file: rpi_led_bargraph.rb

require 'rpi_led'


class RPiLedBarGraph
  
  attr_accessor :brightness

  def initialize(pins, wait: 0.1, dir: :ltr, invert: false)
    
    @pins = pins.map {|x| RPiLed.new x, smooth: false}
    @wait, @dir, @invert = wait, dir, invert
    @level, @brightness, @blink = 100, 100, false
    
  end
  
  def brightness=(val)
    @brightness = val
    level(@level, blink: @blink)
  end

  def on
    a = @dir == :ltr ? @pins : @pins.reverse
    a.each {|x| x.on; sleep @wait}
    @old_level = 100
    :on
  end

  def off
    a = @dir == :ltr ? @pins.reverse : @pins
    a.each {|x| x.off; sleep @wait}
    @old_level = 0
    :off
  end

  def inspect()
    'done'
  end

  # input % from 0-100
  #
  def level(n, blink: false)

    @blink = blink

    upper = (@pins.length / (100.0 / n) - 1).round
    upper = @pins.length - upper - 1 if @invert
    
    a = @dir == :ltr ? @pins : @pins.reverse
    
    
    a.each(&:off)
    a[0..(upper - 1).to_i].each {|x| x.on; x.brightness = @brightness}
   
    if @blink then
      sleep 0.3
      a[upper].brightness = @brightness
      a[upper].blink
    else
      a[upper].off
      sleep 0.3
      a[upper].brightness = @brightness
    end
    
    @level = n
 
  end

  alias progress level
  

end

if __FILE__ == $0 then
  

  g = RPiLedBarGraph.new(%w(26 19 13 6 5 11 20 16 4 12), wait: 0.1)
  g.on; sleep 0.2; g.off

