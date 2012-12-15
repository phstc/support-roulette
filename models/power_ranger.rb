# encoding: utf-8

require "date"

class PowerRanger
  attr_accessor :name, :phone

  def initialize name, phone
    @name  = name
    @phone = phone
  end

  def self.all
    [new("Pablo Cantero", "+5511965056615")]
  end

  def self.current_ranger
    all[0]
  end
end
