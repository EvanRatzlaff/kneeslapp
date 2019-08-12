Evan = User.create(username: "Evan", email: "me@funny.com", password: "test" )

new_material = Material.create(content: "a guy walks to in a bar", time: "12:30", date: "11/21/89", room_performed: "drunken monkey" )
Evan.materials << new_material 
Evan.save