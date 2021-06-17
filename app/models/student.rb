class Student
    attr_reader :first_name
    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def tests
        BoatingTest.all.select{|test| test.student == self}
    end

    def tests_passed
        tests.select{|test| test.boating_test_status == "passed"}
    end

    def add_boating_test(boating_test_name, boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
    end

    def all_instructors
        tests.map{|test| test.instructor}.uniq
    end

    def self.find_student(first_name)
        self.all.find{|student| student.first_name == first_name}
    end

    def grade_percentage
        tests_passed.count.to_f/tests.count * 100.0
    end


end
