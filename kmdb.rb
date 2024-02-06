# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# see db/migrate folder

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#studio table insert

new_studio = Studio.new
new_studio ["name"] = "Warner Bros."
new_studio.save

#movie table insert

warner = Studio.find_by({ "name" => "Warner Bros."})

new_movie = Movie.new
new_movie ["movie_title"] = "Batman Begins"
new_movie ["year_released"] = 2005
new_movie ["MPAA_rating"] = "PG-13"
new_movie ["studio_id"] = warner["id"]
new_movie.save

new_movie = Movie.new
new_movie ["movie_title"] = "The Dark Knight"
new_movie ["year_released"] = 2008
new_movie ["MPAA_rating"] = "PG-13"
new_movie ["studio_id"] = warner["id"]
new_movie.save

new_movie = Movie.new
new_movie ["movie_title"] = "The Dark Knight Rises"
new_movie ["year_released"] = 2012
new_movie ["MPAA_rating"] = "PG-13"
new_movie ["studio_id"] = warner["id"]
new_movie.save

#actors table insert

movie_actors = ["Christian Bale",
"Michael Caine",
"Liam Neeson",
"Katie Holmes",
"Gary Oldman",
"Heath Ledger",
"Aaron Eckhart",
"Maggie Gyllenhaal",
"Tom Hardy",
"Joseph Gordon-Levitt",
"Anne Hathaway"]

for i in movie_actors
    new_actor = Actor.new
    new_actor ["name"] = i
    new_actor.save
end

#role table insert

batman_begins = Movie.find_by({ "movie_title" => "Batman Begins"})
dark_knight = Movie.find_by({ "movie_title" => "The Dark Knight"})
knight_rises = Movie.find_by({ "movie_title" => "The Dark Knight Rises"})

bale = Actor.find_by({"name" => "Christian Bale"})
caine = Actor.find_by({"name" => "Michael Caine"})
neeson = Actor.find_by({"name" => "Liam Neeson"})
holmes = Actor.find_by({"name" => "Katie Holmes"})
oldman = Actor.find_by({"name" => "Gary Oldman"})
ledger = Actor.find_by({"name" => "Heath Ledger"})
eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
hardy = Actor.find_by({"name" => "Tom Hardy"})
levitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
hathaway = Actor.find_by({"name" => "Anne Hathaway"})

new_role = Role.new
new_role ["actor_id"] = bale["id"]
new_role ["movie_id"] = batman_begins["id"]
new_role ["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role ["actor_id"] = caine["id"]
new_role ["movie_id"] = batman_begins["id"]
new_role ["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role ["actor_id"] = neeson["id"]
new_role ["movie_id"] = batman_begins["id"]
new_role ["character_name"] = "Ra's Al Ghul"
new_role.save

new_role = Role.new
new_role ["actor_id"] = holmes["id"]
new_role ["movie_id"] = batman_begins["id"]
new_role ["character_name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role ["actor_id"] = oldman["id"]
new_role ["movie_id"] = batman_begins["id"]
new_role ["character_name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role ["actor_id"] = bale["id"]
new_role ["movie_id"] = dark_knight["id"]
new_role ["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role ["actor_id"] = ledger["id"]
new_role ["movie_id"] = dark_knight["id"]
new_role ["character_name"] = "Joker"
new_role.save

new_role = Role.new
new_role ["actor_id"] = eckhart["id"]
new_role ["movie_id"] = dark_knight["id"]
new_role ["character_name"] = "Harvey Dent"
new_role.save

new_role = Role.new
new_role ["actor_id"] = caine["id"]
new_role ["movie_id"] = dark_knight["id"]
new_role ["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role ["actor_id"] = gyllenhaal["id"]
new_role ["movie_id"] = dark_knight["id"]
new_role ["character_name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role ["actor_id"] = bale["id"]
new_role ["movie_id"] = knight_rises["id"]
new_role ["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role ["actor_id"] = oldman["id"]
new_role ["movie_id"] = knight_rises["id"]
new_role ["character_name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role ["actor_id"] = hardy["id"]
new_role ["movie_id"] = knight_rises["id"]
new_role ["character_name"] = "Bane"
new_role.save

new_role = Role.new
new_role ["actor_id"] = levitt["id"]
new_role ["movie_id"] = knight_rises["id"]
new_role ["character_name"] = "John Blake"
new_role.save

new_role = Role.new
new_role ["actor_id"] = hathaway["id"]
new_role ["movie_id"] = knight_rises["id"]
new_role ["character_name"] = "Selina Kyle"
new_role.save



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""




# Query the movies data and loop through the results to display the movies output.
Movie.all.each do |movie|
    studio = Studio.find_by("id" => movie["studio_id"])
    puts "#{movie["movie_title"]} #{movie["year_released"]} #{movie["MPAA_rating"]} #{studio["name"]}"

end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

Role.all.each do |role|
    actor_name = Actor.find_by("id" => role["actor_id"])
    movie_name = Movie.find_by("id" => role["movie_id"])
    puts "#{movie_name["movie_title"]} #{actor_name["name"]} #{role["character_name"]}"

end
