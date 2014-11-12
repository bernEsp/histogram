class Hist
  def initialize(values, bin_width)
    @values =  values
    @bin_width = bin_width
    @inclusions = 0
    @store = {} 
    @max = @values.sort.last
    @min = 0
  end

  def histogram
    initial = @min
    final = @bin_width
    number_of_groups = (@max.to_f / @bin_width.to_f).ceil
    (1..number_of_groups).each do |group_number|
      inclusions(initial, final)
      @inclusions = 0
      initial = group_number * @bin_width
      final = initial + @bin_width 
    end
    puts @store 
  end

  private
   def inclusions(initial, final)
    (initial...final).each do |number|
        @inclusions += 1 if @values.include?(number)
        @store["[#{initial},#{final})"] = "f=#{@inclusions}" 
    end
   end
end
if __FILE__ == $0
  puts Hist.new([1, 4, 3, 2, 13, 23, 5, 15], 5).histogram
end
