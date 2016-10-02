# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_data = tsv.split("\n").map { |line| line.split("\t") }
    headers = tsv_data.first
    data_rows = tsv_data[1..-1]
    @data = data_rows.map { |row| row.map.with_index { |attr, i| [headers[i], attr] }.to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    result = ''
    #handle column name
    result << @data.first.keys.join("\t") + "\n"
    @data.each do |h_item|
      result << h_item.values.join("\t") + "\n"
    end
    result
  end
end
