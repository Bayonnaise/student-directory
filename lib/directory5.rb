def students
	@students ||= []
end

def add(student)
	students << student
end

def student_to_s(student)
	"#{student[:name]}, #{student[:cohort]} cohort"
end

def students_to_s
	students.map.with_index(1) do |student, index|
		"#{index}.#{student_to_s(student)}"	
	end.join("\n")
end