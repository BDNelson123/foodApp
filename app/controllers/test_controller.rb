class TestController < ApplicationController
  def reverse(string)
    stringCount = string.count(string)
    halfStringCount = stringCount / 2

    halfStringCount.times do |i|
      string[i] = string[stringCount - i - 1]
    end

    render json: string
  end

  def index
    string = "abcdef"
    self.reverse(string)
  end
end
