FROM ruby:2.7

RUN gem install sinatra puma csv

COPY myapp.rb /myapp.rb
COPY views /views
COPY indices.csv /indices.csv

CMD ruby /myapp.rb -o 0.0.0.0