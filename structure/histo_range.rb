module Structure
  class HistoRange < Range
    def to_s
      if exclude_end?
        "[#{self.begin}, #{self.end})" 
      else
        "[#{self.begin}, #{self.end}"
      end
    end
  end
end
