class ScrapingStudent

  attr_accessor :index_url
  attr_reader :student_profiles, :doc

  def initialize(index_url)
    @index_url = index_url
    @doc = doc = Nokogiri::HTML(open(index_url))
    scrape_student_profiles
  end

  def scrape_student_profiles
    @student_profiles ||= doc.search("div.blog-thumb").css("a").collect { |link|
      normalize_student_profiles(link["href"])}.uniq
  end

  def scrape_students
    student_profiles.collect { |profile| Student.new(profile)}
  end

  private

  def normalize_student_profiles(profile)
    profile.start_with?("http://") ? profile : "#{index_url}#{profile}"
  end

end

