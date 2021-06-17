class Instructor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select{|boating_test| boating_test.instructor == self}
    end

    def passed_boating_tests
        boating_tests.select{|boating_test| boating_test.boating_test_status == "passed"}
    end

    def all_students
        boating_tests.map{|boating_test| boating_test.student}
    end

    def passed_students
        passed_boating_tests.map{|boating_test| boating_test.student}
    end

    def find_boating_test(student, boating_test_name)
        boating_tests.find{|boating_test| boating_test.student == student && boating_test.boating_test_name == boating_test_name}
    end

    def pass_student(student, boating_test_name)
        boating_test_found = find_boating_test(student, boating_test_name)
        if boating_test_found
            boating_test_found.boating_test_status = "passed"
            return boating_test_found
        else
            return BoatingTest.new(student, boating_test_name, "passed", self)
        end
    end

    def fail_student(student, boating_test_name)
        boating_test_found = find_boating_test(student, boating_test_name)
        if boating_test_found
            boating_test_found.boating_test_status = "failed"
            return boating_test_found
        else
            return BoatingTest.new(student, boating_test_name, "failed", self)
        end
    end
end
