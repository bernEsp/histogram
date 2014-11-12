class Histogram
  def initialize(values, bin_width)
    @bin_width = bin_width
    @values = values
    @store = {}
  end

  def groups 
    @groups ||= (@values.sort.last.to_f / @bin_width.to_f).ceil
  end

  def generate
    group_range
    frecuency
    @store
  end


  private
    def frecuency
      (1..groups).each do |group|
        @store[group][:frecuency] = (@values & @store[group][:range].to_a).size
      end
    end

    def group_range
      initial = 0
      final = @bin_width
      (1..groups).each do |group_number|
        @store[group_number] = {range: (initial ... final)}
        initial = @bin_width * group_number
        final += @bin_width
      end 
    end


end

if __FILE__ == $0
  puts Histogram.new( [1, 4, 3, 2, 13, 23, 5, 15], 5).generate
end
