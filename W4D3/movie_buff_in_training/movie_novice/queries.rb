# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  #find Angelina Jolie by name in the actors table
  Actor.find_by(name: 'Angelina Jolie')
end

def top_titles
  # get movie titles from movies with scores greater than or equal to 9
  # hint: use 'select' and 'where'
  Movie.select(:id, :title).where("movies.score >= 9")
end
# where(users: { user_name: 'tamboer' }
# where("users.user_name = 'tamboer'")

def star_wars
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'
  Movie.select(:id, :title, :yr).where("movies.title LIKE '%Star Wars%'")

  # (bradley) if you don't get a :column name correct it won't find ANYTHING so this 
  # could be breaking your entire query.
end


def below_average_years
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'
  Movie.select('yr', 'count(*) as bad_movies').where("movies.score < 5").group(:yr).order('count(*) DESC')

  #(bradley) you don't need to put 'movies.score'. 'score' would have worked on it's own  
end

def alphabetized_actors
  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  # Note: Ubuntu users may find that special characters
  # are alphabetized differently than the specs.
  # This spec might fail for Ubuntu users. It's ok!
  Actor.select('*').order('name asc').limit(10)
end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'


  #(bradley)
  # Actor.select(:id, :name).joins(castings: :movie).where("movies.title = 'Pulp Fiction' ")
  # or I can use the through association directly like below..
  Actor.select(:id, :name).joins(:movies).where("movies.title = 'Pulp Fiction' ")
end

def uma_movies
  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'

  #(bradley) do a quick scan of schema to make sure selected columns aren't ambiguous 
  #(and need explicit table.column syntax)
  
  Movie.select(:id, :title, :yr).joins(:actors).where("name = 'Uma Thurman'").order('yr asc')
  #(bradley) could have went the long way .joins(castings: :actor) using two associations
  # notice how the long way (association) always has the non-plural form of the table (is this a coincidence or
  # we are using a joins table, it maybe wouldn't be the case if there we're not joins table and just a foreign key in one table)
end
