require_relative './spec_helper'

describe Twitter do
 let(:twitter){Twitter.new(["Hi, I'm a tweet!","I'm also a tweet!","Hello, world!"])}

  describe ".all" do
    it 'keeps track of student tweets' do
      expect(Twitter.all).to include(twitter)
    end
  end

  describe "#initialize" do
    it 'accepts the students\' tweets as an argument' do
      expect(twitter.student_tweets).to eq(["Hi, I'm a tweet!","I'm also a tweet!","Hello, world!"])
    end
  end  

  describe "#number_of_tweets" do
    it 'outputs the number of tweets' do
      expect(twitter.number_of_tweets).to eq(3)
    end   
  end   

  describe "#tweets_that_include" do
    it 'outputs the tweets that include a certain word' do
      expect(twitter.tweets_that_include("also")).to eq(["I'm also a tweet!"]) 
    end
  end   
end   