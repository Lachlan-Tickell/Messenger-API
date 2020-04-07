users = [
    {
        "first_name" => "Lachlan",
        "last_name" => "Tickell",
        "email" => "lachlan.tickell.93@gmail.com",
        "password" => "Password",
        "messages" => ["Hello", "How are you?"]
    },
    {
        "first_name" => "Nora",
        "last_name" => "Labbancz",
        "email" => "noralabbancz@hotmail.com",
        "password" => "Password",
        "messages" => ["Hello", "Good, thank you sir, how are you?"]
    }
]



users.each_with_index do |user, index|
    new_user = User.create(first_name: user["first_name"], last_name: user["last_name"], email: user["email"], password: user["password"])

end