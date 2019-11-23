#!/usr/bin/ruby

data = [
    {id: 1, name:"foo", birth:1920, death:1970},
    {id: 2, name:"no", birth:1923, death:1940},
    {id: 3, name:"bar", birth:1954, death:2000},
    {id: 4, name:"toto", birth:1941, death:1998},
    {id: 5, name:"tutu", birth:1903, death:2010},
    {id: 6, name:"titi", birth:1934, death:2004},
    {id: 7, name:"tata", birth:1965, death:1987},
    {id: 8, name:"none", birth:1925, death:1929},
    {id: 9, name:"camera", birth:1928, death:1999},
    {id: 10, name:"very", birth:1967, death:2010},
    {id: 11, name:"deep", birth:1944, death:1980},
    {id: 12, name:"peticuliar", birth:1925, death:1938},
    {id: 13, name:"single", birth:1958, death:1978}
]

def get_date_max_people_alive(data)
  (1900..2000).each_with_object({}) do |date, hash|
    hash[date] = count_alive(date, data)
  end.sort_by{|_, v| v}.last
end

def count_alive(date, data)
  count = 0
  data.each do |hash|
    count += 1 if hash[:birth] <= date && hash[:death] > date
  end
  count
end
  
puts get_date_max_people_alive(data)
