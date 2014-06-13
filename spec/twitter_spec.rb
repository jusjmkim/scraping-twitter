require_relative './spec_helper'

describe Twitter do
 let(:twitter){Twitter.new(["Hi, I'm a tweet!","I'm also a tweet!","Hello, world!"])}

  describe ".all" do
    it 'keeps track of student tweets' do
      expect(Twitter.all).to include(twitter)
    end
  end

  describe "#initialize" do
    it 'accepts the students\' tweets' do
      expect(student_tweets).to eq(["Hi, I'm a tweet!","I'm also a tweet!","Hello, world!"])
    end
  end  

  describe "#number_of_tweets" do
    it 'outputs the number of tweets' do
      expect(twitter.number_of_tweets).to eq(3)
    end   
  end   

  describe "#keyword_count" do
    it 'outputs the number of times a keyword is included in a tweet' do
      expect(twitter("also")).to eq(1) 
    end
  end   
end   