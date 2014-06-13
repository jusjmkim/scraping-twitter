require_relative './spec_helper'

describe Student do
  let(:student){Student.new("http://ruby005.students.flatironschool.com/students/chriscallahan.html")}

  describe "#initialize" do
    it "takes the student profile as an argument" do
      expect(student.student_profile).to eq("http://ruby005.students.flatironschool.com/students/chriscallahan.html")
    end
  end

  describe ".all" do
    it "keeps track of all students" do
      expect(Student.all).to include(student)
    end
  end

  describe "attributes" do

    it "has the correct name" do
      expect(student.name).to eq("Chris Callahan")
    end

    it "has the correct twitter" do
      expect(student.twitter).to eq("https://twitter.com/_c_cal")
    end
  end

end