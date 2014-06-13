class ScrapingStudent

  doc = Nokogiri::HTML(open('http://ruby005.students.flatironschool.com/'))
  @students = []
  student_profiles = doc.search("div.blog-thumb").css("a").collect{|link| link.attribute("href").value}.uniq

  #input array into hash
  def array_into_hash(symbol, array, students)
    if students.empty?
      array.each do |element|
        student_hash = {}
        student_hash[symbol] = element
        students << student_hash
      end
    else
      students.each_with_index do |hash, index|
      hash[symbol] = array[index]
      end
    end
    students
  end

  #names
  names = doc.css("h3").text.split("\n").collect{|word|word.strip}.uniq
  names.slice!(0)
  names.slice!(1)
  array_into_hash(:name, names, @students)

  twitter = []
  student_profiles.each do |profile|
    page = Nokogiri::HTML(open("http://ruby005.students.flatironschool.com/#{profile}"))

    tweet = page.search("div.social-icons").css("a").attribute("href").value
    twitter << tweet
  end
  array_into_hash(:twitter, twitter, @students)

end
