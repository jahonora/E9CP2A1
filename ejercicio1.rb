class Table
	attr_reader :name
	def initialize(name, day1, day2, day3, day4)
		@name = name
		@days = [day1.to_i, day2.to_i, day3.to_i, day4.to_i]
	end

	def to_s
		"#{@name}, #{@day1}, #{@day2}, #{@day3}, #{@day4}"
	end

	def best_day
		best = 0
		num = 0
		@days.each_with_index do |day, index|
			if best < day
				best = day
				num = index + 1
			end
		end
		[best, num]
	end

	def average_winnings
		@days.reduce(0){|sum, d| sum + d}/@days.size
	end
end


tables_list = []
data = []

File.open('casino.txt', 'r'){|file| data = file.readlines}

data.each do |line|
	ls = line.split(", ")
	tables_list << Table.new(*ls)
end

tables_list.each do |table| 
	best, num = table.best_day
	puts "El mejor dia de ventas de la #{table.name} fue el dia #{num} con una cantidad de ventas de #{best}"
end

tables_list.each do	|table|
	puts "El promedio de ventas de la #{table.name} fue de: #{table.average_winnings} "
end