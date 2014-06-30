require 'directory5'

describe 'student directory' do
	it 'has no students' do
		expect(students).to be_empty
	end

	it 'adds a student' do
		student = { name: "David", cohort: "June" }
		add(student)
		expect(students).to eq [student]
	end

	it 'gives us a student line' do
		student = { name: "David", cohort: "June" }
		expect(student_to_s(student)).to eq 'David, June cohort'
	end

	it 'gives us a whole bunch of student lines' do
		%w{David Chloe Zoe}.each do |name|
			add({name: name, cohort: 'June'})
		end

		expect(students_to_s).to eq "1. David, June cohort\n2. Chloe, June cohort\n3. Zoe, June cohort"
	end

	it 'prints em' do
		%w{David Chloe Zoe}.each do |name|
			add({name: name, cohort: 'June'})
		end
		expect(self).to receive(:show).with("1. David, June cohort\n2. Chloe, June cohort\n3. Zoe, June cohort")

		print_students
	end
	
	context 'informs about schtuff' do

		it 'prints a string to the terminal' do
			expect(self).to receive(:puts).with("HELLO!")
			show("HELLO!")
		end

		it 'prints header' do
			expect(self).to receive(:show).with("Welcome to the Makers Academy\nThe students of my cohort are...")
			print_header
		end

		it 'prints footer' do
			expect(self).to receive(:show)
			print_footer(students)
		end
	end

	context 'should prompt for' do
		it 'name' do
			input = "Chloe"
			expect(self).to receive(:puts).with("Please enter the student's name")
			expect(self).to receive(:gets).and_return(input)
			expect(request_name).to eq "Chloe"
		end

		it 'cohort' do
			input = "June"
			expect(self).to receive(:puts).with("Please enter the student's cohort")
			expect(self).to receive(:gets).and_return(input)
			expect(request_cohort).to eq "June"
		end

		it 'hobby' do
			input = "Being noisy"
			expect(self).to receive(:puts).with("Please enter the student's hobby")
			expect(self).to receive(:gets).and_return(input)
			expect(request_hobby).to eq "Being noisy"
		end

		# it 'anything we want' do
		# 	thing = hobby
		# 	expect(self).to receive(:puts).with("Please enter the student's #{thing}")
		# 	expect(self).to receive(:gets).and_return(thing)
		# 	expect(request(thing)).to eq "hobby"
		# end

	end

	# it 'prints each of the elements in a hash' do
	# 	expect(self).to receive(:show)
	# 	print_array
	# end
end