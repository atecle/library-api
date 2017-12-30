require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

page = HTTParty.get("https://www.goodreads.com/list/show/2681.Time_Magazine_s_All_Time_100_Novels")

parse_page = Nokogiri::HTML(page)

titles = []
authors = []
books = []

parse_page.css("td[width='100%']").css(".bookTitle").css("span[itemprop='name']").each do |row|
  title = row.text
  titles.push(title)
end

parse_page.css("td[width='100%']").css(".authorName").css("span[itemprop='name']").each do |row|
  author = row.text
  authors.push(author)
end

0.upto(99) do |i|
  books.push({ :title => titles[i], :author => authors[i] })
end

Pry.start(binding)
