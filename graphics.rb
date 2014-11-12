require './histogram'
class Graphics
  def initialize
    puts "give the list of values: "
    @values=  gets.chomp
    puts "give the the bin_width: "
    @bin_width = gets.chomp
  end

  def pretty_print
    @histogram = Histogram.new(@values, @bin_width).generate
    @histogram.each do |key, value|
      puts "[#{value[:range]})   (f=#{value[:frecuency]}) #{'#'*value[:frecuency]}"
    end
  end
end
if __FILE__ == $0
  Graphics.new.pretty_print
end
