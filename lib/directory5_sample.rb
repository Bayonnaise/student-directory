def add(student)
	students << student
end

def students
	@students ||= []
end

def student_to_s(student)
	"#{student[:name]}, #{student[:cohort]} cohort"
end

def students_to_s
	students.map.with_index(1) do |student, index|
		"#{index}. #{student_to_s(student)}"
	end.join("\n")
end

def print_students
	show students_to_s
end

# def is_a_hash?
# 	true
# end

# def user_input
# 	gets.chomp
# end

def show(string)
 puts string
end

def print_header
	show "Welcome to the Makers Academy\nThe students of my cohort are..."
end

def print_footer(names)
	show "Overall , we have #{names.length} superdooper students"
end

def print_array
	show "test"
end

def request_name
	show "Please enter the student's name"
	request("name")
end

def request_cohort
	show "Please enter the student's cohort"
	request("cohort")
end

def request_hobby
	show "Please enter the student's hobby"
	request("hobby")
end

def request(thing)
	thing = gets.chomp
end



# request(hobby)
# request(cohort)
# request()

# request_hobby