class Payroll
  def update( changed_employee )
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class Manager
  def update( employee )
    puts "Oh! We're spending so much money."
  end
end

class Emailer
  def update( something )
    puts "This is an email."
  end
end

class Employee
  attr_reader :name, :title
  attr_reader :salary

  def initialize( name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @ducks = []
  end

  def add_observer(observer)
    @ducks << observer
  end

  def salary=(new_salary)
    @salary = new_salary
    @ducks.each do |duck|
      duck.update(self)
    end
  end
end

fred = Employee.new('Fred', 'Crane Operator', 30000)
fred.add_observer(Payroll.new)
fred.add_observer(Manager.new)
fred.add_observer(Emailer.new)
fred.salary = 35000
