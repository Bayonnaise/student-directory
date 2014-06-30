require 'directory5'

describe 'student directory' do
	it 'has no students' do
		expect(students).to be_empty
	end

	it 'add a student' do
		student = [{name: "David", cohort: "June"}]
		add(student)
		expect(students).to eq [student]
	end

	it 'give us a student line' do
		student = {name: "David", cohort: "June"}
		expect(student_to_s(student)).to eq "David, June cohort"
	end

	it 'gives us a whole bunch of student lines' do
		["David", "chloe", "sam"].each do |name|
			add({name: name, cohort: "June"})
		end
		expect(students_to_s).to eq "1.David, June cohort\n2.chloe, June cohort\n3.sam, June cohort"
	end
end