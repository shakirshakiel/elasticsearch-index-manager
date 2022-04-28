require 'sinatra'
require 'csv'

class EsIndex
    attr_accessor :index_name, :creation_date

    def initialize(index_name, creation_date)
        @index_name = index_name
        @creation_date = Time.at(creation_date.to_i / 1000)
    end
end

get '/' do
  'Hello world!'
end

post '/sync' do

end

get '/days_open' do
    csv_lines = CSV.read("indices.csv")
    es_indices = []

    csv_lines.each do |line|
       es_indices << EsIndex.new(line[0], line[2]) if line[1] == "open"
    end

    date_groups = es_indices.group_by {|i| i.creation_date.strftime("%Y-%m-%d") }
    erb :days_open, :locals => {dates: date_groups.keys, size: date_groups.keys.size}
end

get '/indices_open' do
    csv_lines = CSV.read("indices.csv")
    es_indices = []

    csv_lines.each do |line|
       es_indices << EsIndex.new(line[0], line[2]) if line[1] == "open"
    end

    index_groups = es_indices.group_by {|i| i.index_name }
    erb :indices_open, :locals => {indices: index_groups.keys, size: index_groups.keys.size}
end

post '/close_indices' do
end

post '/open_indices' do
end

get '/problematic_aliases' do
end
