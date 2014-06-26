@students = []
@months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
@filename = ARGV.first

def check_cohort cohort
	while !@months.include?(cohort.capitalize)
		# is in array
		puts "That doesn't look like a month. Try again."
		cohort = STDIN.gets.chomp
	end
	cohort.capitalize.to_sym
end

def lonely_student
	if @students.length == 1
		"student"
	else
		"students"
	end
end

def sort_by_cohort # ahhh sort out later what even is this
	used_cohorts = @students.map do |student|
		student[:cohort].uniq
	end

	sorted_students = used_cohorts.map do |month|
		# @students.
	end
	# month_array = @students.map { |student| student[:cohort] if student[:cohort] == month }
end

def input_students
	puts "Please enter a name"
	name = STDIN.gets.chomp

	while !name.empty? do
		puts "What cohort is #{name} in?"
		cohort = STDIN.gets.chomp
		cohort = check_cohort cohort # check if is actually a month

		puts "What is one of #{name}'s hobbies?"
		hobby = STDIN.gets.chomp

		puts "Where does #{name} come from?"
		country = STDIN.gets.chomp

		@students << {:name => name, :cohort => cohort, :hobby => hobby, :country => country}

		puts "Your list now contains #{@students.length} #{lonely_student}."
		puts "Please enter another name, or press enter twice to exit"
		name = STDIN.gets.chomp
	end
	# goes back to menu
end

def show_students
	if @students.length > 0
		puts "This is the Makers Academy #{lonely_student} list"
		puts "-------------------------------------------"

		@students.each.with_index(1) do |student, index|
			puts "#{index}. #{student[:name]} from the #{student[:cohort]} cohort likes #{student[:hobby]} and is from #{student[:country]}."
		end

		puts "-------------------------------------------"
		puts "Makers Academy has #{@students.length} #{lonely_student}"
	else
		puts "No students found. Please add or load some students!"
	end
end

def check_file_exists
	puts "Our student list would like to work with a file to save or load our data."
	while !File.exists?(@filename) do
		puts "#{@filename} doesn't exist, do you want to create it? (y/n)"
		input = STDIN.gets.chomp

		case input
			when "y"
				#create file
				new_file = File.new(@filename, "w")
				new_file.close
				puts "Successfully creates #{@filename}"
			when "n"
				#exit
				puts "Try specifying a different file:"
				@filename = STDIN.gets.chomp
			else
				puts "Please enter 'y' or 'n' to indicate your choice."
		end
		puts "Checking #{@filename} exists...."
	end
	@filename
end

def save_students
	file = File.open(@filename, 'w')
	@students.each do |student|
		data = [student[:name], student[:cohort], student[:hobby], student[:country]]
		line = data.join(',')
		file.puts line
	end
	file.close
	puts "Successfully saved to #{@filename}!"
end

def load_students
	file = File.open(@filename, 'r')
	file.readlines.each do |line|
		name, cohort, hobby, country = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym, :hobby => hobby, :country => country}
	end
	file.close
	puts "\nSuccessfully updated the student list from #{@filename}!"
end

def try_load_students
	@filename = "students.csv" if @filename.nil?

	@filename = check_file_exists

	load_students
	puts "Successfully loaded #{@students.length} #{lonely_student} from #{@filename}!\n"
end

def print_menu
	puts
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit" # 9 because we'll be adding more items  
	puts
end

def process selection
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "3"
		save_students
	when "4"
		load_students
	when "9"
		puts "Cheerio!"
		exit
	else
		"Please enter a valid option"
	end	
end

def interactive_menu
	puts "Welcome!"
	loop do
		print_menu
		process STDIN.gets.chomp
	end
end

try_load_students # Was a @filename passed?
interactive_menu