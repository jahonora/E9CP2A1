require 'Date'
class Courses
	attr_reader :name
	def initialize(name, init_date, final_date)
		@name = name
		@init_date = Date.parse(init_date)
		@final_date = Date.parse(final_date)
	end

	def to_s
		"#{@name}, #{@init_date}, #{@final_date}"
	end

	def start_before?(date)
		date = Date.today if date.nil?
		raise Exception, "La fecha es mayor a 2019-01-01" if date > Date.new(2019,1,1)
		@init_date < date
	end

	def finish_after?(date)
		date = Date.today if date.nil?
		raise Exception, "La fecha es mayor a 2019-01-01" if date > Date.new(2019,1,1)
		@final_date > date
	end
end


#METODOS DE REVISION

def courses_start_before(date, courses_list)
	courses_list.each do |course|
		puts "El curso #{course.name} comienza antes de la fecha entregada" if course.start_before?(date)
	end
end


def courses_finish_after(date, courses_list)
	courses_list.each do |course|
		puts "El curso #{course.name} termina despues de la fecha entregada" if course.finish_after?(date)
	end
end


#EJECUCION

courses_list = []
data = []

File.open('cursos.txt', 'r'){|file| data = file.readlines}

data.each do |line|
	ls = line.split(", ")
	courses_list << Courses.new(*ls)
end

puts courses_list

date = Date.new(2017,5,10)
courses_start_before(date, courses_list)

date = Date.new(2017,10,10)
courses_finish_after(date, courses_list)



