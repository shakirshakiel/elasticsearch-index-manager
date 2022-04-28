FROM ruby:2.7

RUN gem install sinatra puma
COPY myapp.rb /myapp.rb

CMD ruby /myapp.rb -o 0.0.0.0