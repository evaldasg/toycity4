require_relative 'udacidata'

class Product < Udacidata
  attr_reader :id, :price, :brand, :name

  def initialize(options = {})
    fetch_last_id
    @id = options[:id] ? options[:id].to_i : @count_class_instances
    auto_increment_id unless options[:id]
    @brand = options[:brand]
    @name = options[:name]
    @price = options[:price]
  end

  private

  def fetch_last_id
    path = File.dirname(__FILE__) + '/../data/data.csv'
    last_id = CSV.read(path).last[0].to_i + 1 if File.exist?(path)

    @count_class_instances = last_id || 0
  end

  def auto_increment_id
    @count_class_instances += 1
  end
end
