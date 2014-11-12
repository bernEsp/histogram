require './structure/histo_range'
class Histogram
  def initialize(values, bin_width)
    @bin_width = bin_width.to_i
    @values = case values
              when String then values.split(',').map(&:to_i)
              else  values
             end
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
        @store[group_number] = {range: Structure::HistoRange.new(initial,final, true)}
        initial = @bin_width * group_number
        final += @bin_width
      end 
    end
end
