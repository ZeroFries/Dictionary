class File
	def add_to_log(log)
		# adds each word between 1 and 15 letters from the list files to the 2d log array, which sorts words into arrays by word size
		self.each_line { |line| log[line.chomp.size] << line.chomp if (line.chomp.size > 0 && line.chomp.size < 16) }
	end
end

class Dictionary
	attr_accessor :log

	def initialize
		@log = []
		(1..12).each do |i|
			log[i] = [] # initialize 2d log array so shovel can be used
		end
		(1..9).each do |i|
		  file = File.open("../american-words.#{i}0", "r").add_to_log(@log)
		  file = File.open("../english-words.#{i}0", "r").add_to_log(@log)
		end
	end
end