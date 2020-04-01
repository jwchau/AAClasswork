require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

# reset
# load '01_sql_object.rb'
# joe = Human.new
# joe.class.table_name = "humans"
# joe.class


require 'byebug'

class SQLObject
  def self.columns
    # ...
    if @columns.nil?
      c = DBConnection.execute2(<<-SQL)
        SELECT *
        FROM cats
      SQL
      @columns = c[0].map(&:to_sym)
    end
    @columns
  end

  def self.finalize!
    # debugger
    self.columns.each do |col|
      define_method(col) { self.attributes[col] }
      define_method("#{col}=") { |val| self.attributes[col] = val }
    end
    true
  end

  def self.table_name=(table_name)
    # ...
    instance_variable_set("@table_name", table_name)
  end

  def self.table_name
    # ...
    @table_name ||= self.to_s.tableize
  end

  def self.all
    self.parse_all(DBConnection.execute("select * from #{self.table_name}"))
  end

  def self.parse_all(results)
    results.map { |thing| self.new(thing) }
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    c = self.class.columns
    params.each do |k, v|
      raise "unknown attribute '#{k}'" unless c.include?(:"#{k}")
      self.send("#{k}=", v)
    end
    self
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end

end

class Kat < SQLObject

  self.finalize!
end

class Human < SQLObject

  self.finalize!
end