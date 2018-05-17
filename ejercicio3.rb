class Roulette
	def initialize
		@r = (1..10).to_a
	end

	def play(num)
		roulette = @r.sample
		save_history(roulette)
		if roulette == num
			save_winners(roulette)
			puts "WINNER!!"
		else
			puts "LOOSER!!"
		end 
	end

	def save_history(num)
		File.open('roulette_history.txt', 'a'){|file| file.puts "#{num}"}
	end

	def save_winners(num)
		File.open('winners.txt', 'a'){|file| file.puts "#{num}"}
	end

	def most_common_number
		data = []
		most = -1
		count = 0
		File.open('roulette_history.txt', 'r'){|file| data = file.readlines}
		h = data.group_by{|e| e}
		h.each do |k,v|
			if count < v.count
				most = k.to_i
				count = v.count
			end
		end

		if most > 0
			puts "El numero que mas se repite es #{most} y se ha repetido #{count}"
		else
			puts "No hay numeros aun"
		end
	end

end


roulette = Roulette.new
100.times do
	num = (1..10).to_a.sample
	roulette.play(num)
end

roulette.most_common_number