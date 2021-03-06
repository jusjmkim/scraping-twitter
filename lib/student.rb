class Student
  attr_accessor :student_profile
  attr_reader :doc

  @@all = []

  def self.all
    @@all
  end

  def initialize(student_profile)
    @student_profile = student_profile
    @doc = Nokogiri::HTML(open(student_profile))
    @@all << self
  end

  def name
    @name ||= doc.search("div.page-title h4").text
  end

  def twitter
    @twitter ||= doc.search("div.social-icons a[href*='twitter.com']").first["href"]
  end 

end