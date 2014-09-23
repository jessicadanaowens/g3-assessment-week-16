require "csv"
class HydroponicsTracker

  def initialize(file, name1, name2, name3)
    @file = file
    @container1_name = name1
    @container2_name = name2
    @container3_name = name3
  end

  def array_of_data
    @file.split("\n")
  end

  def container1_array
    container_array = []
    hash = {}

    array_of_data.each do |string|
      array = string.split(" ")
      if array[3] == @container1_name
        container_array.push(array)
      end
    end
    container_array
  end

  def container2_array
    container_array = []
    hash = {}

    array_of_data.each do |string|
      array = string.split(" ")
      if array[3] == @container2_name
        container_array.push(array)
      end
    end
    container_array
  end

  def container3_array
    container_array = []
    hash = {}

    array_of_data.each do |string|
      array = string.split(" ")
      if array[3] == @container3_name
        container_array.push(array)
      end
    end
    container_array
  end

  def average_ph(container_array)
    sum = 0
    length = container_array.length
    container_array.each do |array|
      sum += array[4].to_f
    end

    (sum / length).round(2)
  end

  def average_nutrient(container_array)
    sum = 0
    length = container_array.length
    container_array.each do |array|
      sum += array[5].to_f
    end
    (sum / length).round(2)
  end

  def average_temperature(container_array)
    sum = 0
    length = container_array.length
    container_array.each do |array|
      sum += array[6].to_f
    end
    (sum / length).round(2)
  end

  def average_water_level(container_array)
    sum = 0
    length = container_array.length
    container_array.each do |array|
      sum += array[7].to_f
    end
    (sum / length).round(2)
  end

  def average
    {
      @container1_name => {'pH' => average_ph(container1_array), 'nutrient solution level' => average_nutrient(container1_array), 'temperature' => average_temperature(container1_array), 'water level' => average_water_level(container1_array)},
      @container2_name => {'pH' => average_ph(container2_array), 'nutrient solution level' => average_nutrient(container2_array), 'temperature' => average_temperature(container2_array), 'water level' => average_water_level(container2_array)},
      @container3_name => {'pH' => average_ph(container3_array), 'nutrient solution level' => average_nutrient(container3_array), 'temperature' => average_temperature(container3_array), 'water level' => average_water_level(container3_array)}
    }
  end

  def highest_average_temp
    if average_temperature(container1_array) > average_temperature(container2_array) && average_temperature(container1_array) > average_temperature(container3_array)
      return @container1_name
    end
    if average_temperature(container2_array) > average_temperature(container1_array) && average_temperature(container2_array) > average_temperature(container3_array)
      return @container2_name
    end
    if average_temperature(container3_array) > average_temperature(container1_array) && average_temperature(container3_array) > average_temperature(container2_array)
      return @container3_name
    end
  end

  def highest_absolute_water
    if average_water_level(container1_array) > average_water_level(container2_array) && average_water_level(container1_array) > average_water_level(container3_array)
      return @container1_name
    end
    if average_water_level(container2_array) > average_water_level(container1_array) && average_water_level(container2_array) > average_water_level(container3_array)
      return @container2_name
    end
    if average_water_level(container3_array) > average_water_level(container1_array) && average_water_level(container3_array) > average_water_level(container2_array)
      return @container3_name
    end
  end

end