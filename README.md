# Resume

Forked from [Dan Mayer][dm]  
[dm]: http://github.com/danmayer/Resume

Currently it is best to fork the project and override a few of the data files to customize the project for yourself.
At the moment you need to override data/resume.yml and data/resume.md in the root directory with your own info.

Contributions and ideas for the resume app are welcome, anything that makes the process simpler would be encouraged.

# Authors

* Nathaniel "Nat" Welch (icco)
* Dan Mayer (danmayer)
* Trey Caldwell (treycaldwell)

I just wanted a quick and easy way to get my resume on heroku so I forked this and changed the requisite files.  I haven't tried the github personal page deploy or packing my resume as a ruby gem.  PDF generation is now working on heroku as well as support for [New Relic](https://devcenter.heroku.com/articles/newrelic#ruby).  


## Installation

Basic resume in multiple formats on Heroku

1. Fork this project
2. Install the gems (see the .gems file)
3. To deploy to Heroku, also install the heroku gem, and intialize a heroku project
  * Run ` rake heroku:create name=batman-resume`
4. type `rake run` or `ruby ./resume.rb` to run sinatra locally (http://localhost:4567).
5. Edit views/style.less to make your resume look pretty.
6. Edit everything until it looks exactly how you like it. I suggest using Dingus for testing your Markdown (http://daringfireball.net/projects/markdown/dingus)
7. Setup New Relic (see above link)
  * Run `heroku config:set RACK_ENV=production`
  * Run `heroku config:set NEW_RELIC_LICENSE_KEY=_put your license key here_`
  * Run `heroku config:set NEW_RELIC_APP_NAME=_put the app name you want for new relic here_`
8. `rake deploy:heroku` to push your resume to the internet on heroku (http://batman-resume.heroku.com).

## License

resume.md is property of Nathaniel "Nat" Welch. You are welcome to use it as a
base structure for your resume, but don't forget, you are not him.

The rest of the code is licensed CC-GPL. Remember sharing is caring.
