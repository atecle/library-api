# http://aalvarez.me/blog/posts/testing-a-rails-api-with-rspec.html
Shoulda::Matchers.configure do |config|
  config.integrate do |with|

    with.test_framework :rspec

    with.library :rails
  end
end
