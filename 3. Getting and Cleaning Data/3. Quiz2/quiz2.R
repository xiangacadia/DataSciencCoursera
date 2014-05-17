library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "16644ccdf8256ac632cf", "e86e77186f9c6b7315f4d18af12c30ce729e87a8")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
x <- content(req)


file <- download.file("http://biostat.jhsph.edu/~jleek/contact.html", destfile="quiz2.html",method="curl")
text <- readLines("quiz2.html")
nchar(text[10])
nchar(text[20])
nchar(text[30])
nchar(text[100])
