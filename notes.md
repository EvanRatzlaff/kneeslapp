###users###
has many :material


username/email/password_digest

user_routes 
get '/login'
post'/login'

get'/signup'
post'/signup'

get '/users/:id'




#####material####
belong to user 

time/date/room_performed/laughter/content

get '/materials/new'
