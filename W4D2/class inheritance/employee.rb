class Employee
  attr_accessor :salary, :title, :boss
  def initialize(salary, title, boss)
    @salary = salary
    @title = title
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier 
  end
end

require "byebug"

class Manager < Employee
  attr_accessor :employees
    def initialize(salary, title, boss = nil)
      @employees = Array.new
      super
    end

    def bonus(multiplier)
      sum = 0
      queue = employees
      until queue.empty?
        current = queue.shift
        sum += current.salary
        if current.is_a?(Manager)
          queue = queue + current.employees
        end
      end
      sum * multiplier
    end
end

ned = Manager.new(1000000, "Founder", nil)
darren = Manager.new(78000, "TA Manager", ned)
shawna = Employee.new(12000, "TA", darren)
david = Employee.new(10000, "TA", darren)

ned.employees = [darren]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p shawna.bonus(3) # => 36_000
p david.bonus(3) # => 30_000
