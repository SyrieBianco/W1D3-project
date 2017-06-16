require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject


  def self.columns
    return @columns if @columns
    columns = (DBConnection.execute2(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    SQL
    ).first

    columns.map!(&:to_sym)
    @columns = columns
  end

  def self.finalize!
    self.columns.each do |column|

      define_method(column) do
        attributes[column]
      end

      define_method("#{column}=") do |value|
        attributes[column] = value
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    all = DBConnection.execute(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    SQL
    self.parse_all(all)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      #{self.table_name}.id = ?
    SQL

    self.parse_all(result).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      unless self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      end
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    columns = self.class.columns

    values = columns.map { |col| self.send(col) }
  end

  def insert
    columns = self.class.columns

    col_names = columns.join(', ')

    question_marks = (["?"] * columns.length)
    question_marks = question_marks.join(', ')

    attrs = self.attribute_values

    DBConnection.execute(<<-SQL, *attrs)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      SQL

      self.id = DBConnection.last_insert_row_id

  end

  def update
    columns = self.class.columns

    set = columns.map { |col| "#{col} = ?" }.join(", ")

    attrs = self.attribute_values

    DBConnection.execute(<<-SQL, *attrs, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set}
      WHERE
        #{self.class.table_name}.id = ?
      SQL
  end

  def save
    id.nil? ? insert : update
  end
end
