require_relative './spec_helper'

describe ScrapingStudent do
  let(:index_scraper){ScrapingStudent.new("http://ruby005.students.flatironschool.com/")}

  describe "#initialize" do
    it "takes the index page as an argument" do
      expect(index_scraper.index_url).to eq("http://ruby005.students.flatironschool.com/")
    end
  end

  describe "#scrape_student_urls" do
    it "should return an array of student profile urls" do
      index_scraper.scrape_student_urls
      expect(index_scraper.student_urls).to include("http://ruby005.students.flatironschool.com/students/chriscallahan.html")
    end
  end

  describe "#create_student_instances" do
    it "should make an array of Student objects" do
      index_scraper.create_student_instances
      expect(index_scraper.create_student_instances.first).to be_an_instance_of(Student)
    end
  end  

end