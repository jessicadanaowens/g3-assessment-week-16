require 'spec_helper'

describe 'HydroponicsTracker' do
  def read_file(file)
    my_file = ""
    File.open(file,'r') do |f|
      f.each_line {|line| my_file += line}
    end
    my_file
  end

  def parse_response(file, name1, name2, name3)
    HydroponicsTracker.new(read_file(file), name1, name2, name3)
  end

  # describe 'metrics.tsv' do
  #   it 'return a hash that has the average ph, average nutrient solution level, average temperature and average water level for each container mentioned in the file' do
  #     expect(parse_response('data/metrics.tsv', 'container1', 'container2', 'container3').average).to eq({
  #      'container1' => {'pH' => 5.01, 'nutrient solution level' => 39.02, 'temperature' => 57.76, 'water level' => 2.12},
  #      'container2' => {'pH' => 5.95, 'nutrient solution level' => 19.77, 'temperature' => 73.06, 'water level' => 3.8},
  #      'container3' => {'pH' => 7.01, 'nutrient solution level' => 10.97, 'temperature' => 67.61, 'water level' => 4.7}
  #                                                                                                        })
  #   end
  # end

  describe 'metrics.tsv' do
    it 'return the name of the container that has the highest average temperature for all of the data loaded' do
      expect(parse_response('data/metrics.tsv', 'container1', 'container2', 'container3').highest_average_temp).to eq('container2')
    end
  end
end



