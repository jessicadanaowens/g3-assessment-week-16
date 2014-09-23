require 'byebug'
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

  describe 'average' do
    it 'return a hash that has the average ph, average nutrient solution level, average temperature and average water level for each container mentioned in the file' do
      expect(parse_response('data/metrics.tsv', 'container1', 'container2', 'container3').average).to eq({
       'container1' => {'pH' => 5.01, 'nutrient solution level' => 39.02, 'temperature' => 57.76, 'water level' => 2.12},
       'container2' => {'pH' => 5.95, 'nutrient solution level' => 19.77, 'temperature' => 73.06, 'water level' => 3.8},
       'container3' => {'pH' => 7.01, 'nutrient solution level' => 10.97, 'temperature' => 67.61, 'water level' => 4.7}
                                                                                                         })
    end
  end

  describe 'highest average temp' do
    it 'returns the name of the container that has the highest average temperature for all of the data loaded' do
      expect(parse_response('data/metrics.tsv', 'container1', 'container2', 'container3').highest_average_temp).to eq('container2')
    end
  end

  describe 'highest absolute water level' do
    it 'returns the name of the container that has the highest absolute water level for all of the data loaded' do
      expect(parse_response('data/metrics.tsv', 'container1', 'container2', 'container3').highest_absolute_water).to eq('container3')
    end
  end

  describe 'average of all data' do
    it 'returns a hash that has the average ph, average nutrient solution level, average temperature and average water level for all of the data loaded' do
      expect(parse_response('data/metrics.tsv', 'container1', 'container2', 'container3').average_all).to eq({
        'pH' => 5.99, 'nutrient solution level'=> 23.25, 'temperature' => 66.15, 'water level' => 3.54
                                                                                                             })
    end
  end

  describe 'highest absolute pH for a date range' do
    it 'returns the name of a container that has the highest absolute ph for a date range' do
      expect(parse_response('data/metrics.tsv', 'container1', 'container2', 'container3').highest_ph_for_date("2013-01-01", "2014-03-10")).to eq('container3')
    end
  end


end



