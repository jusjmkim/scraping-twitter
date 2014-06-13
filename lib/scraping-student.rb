class ScrapingStudent

  attr_accessor :index_url
  attr_reader :student_urls, :doc

  def initialize(index_url)
    @index_url = index_url
    @doc = doc = Nokogiri::HTML(open(index_url))
    scrape_student_urls
  end

  def scrape_student_urls
    @student_urls ||= doc.search("div.blog-thumb").css("a").collect { |link|
      normalize_student_urls(link["href"])}.uniq
  end

  def create_student_instances
    student_urls.collect { |profile| Student.new(profile)}
  end

  private

  def normalize_student_urls(url)
    url.start_with?("http://") ? url : "#{index_url}#{url}"
  end

end

