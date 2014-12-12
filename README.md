AgileRootsRuby
==============

This is the code for Agile Roots in Ruby

#Basic Start Guide#

To run this code do the following:

`git clone git@github.com:trcollinson/AgileRootsRuby.git`

`bundle`

`rspec`

This will run all of the tests!

#Starting Ruby from Scratch#

###Details and Instructions###

- Download Ubuntu 14.04 LTS (http://www.ubuntu.com/download/desktop/)
- Install Ubuntu 14.04 LTS with standard settings:
	- Download updates on install
	- Download 3rd party drivers on install
- Open your Terminal Window by clicking the upper left hand "spiral" menu and typing "Terminal" and hitting enter.
- Install git:
	- `sudo apt-get install git`
- Install OpenSSL for development:
	- `sudo apt-get install libssl-dev`
		- This is a requirement for Ruby to install later.
- Install rbenv, a Ruby environment manager:
	- `git clone https://github.com/sstephenson/rbenv.git ~/.rbenv`
		- This uses git to download rbenv from Github and put it into the hidden folder ".rbenv" at the root of your users home directory
	- `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
		- This uses "echo" a tool to echo text, to write a line to your hidden .bashrc file. The PATH allows the Linux Terminal to run commands from that location specified. Ultimately this will allow us to run the command "rbenv" on the terminal more easily.
	- `echo 'eval "$(rbenv init -)"' >> ~/.bashrc`
		- This uses the echo command to add an eval into your hidden .bashrc file. This will allow for auto completing special rbenv names on the terminal, also very useful!
	- `source ~/.bashrc`
		- This allows the changes you've made above to take effect.
	- `type rbenv`
		- The output of this should be a command which says "rbenv is a function". This means everything is working!
	- `git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`
		- This adds functionality to rbenv which will allow us to install one or multiple versions of Ruby.
- Install Ruby:
	- `rbenv install 2.1.2`
		- This will install MRI Ruby 2.1.2 which means Matz Ruby Interpreter version 2.1.2, a standard, stable version.
	- `rbenv global 2.1.2`
		- This sets your global Ruby version to 2.1.2
	- `ruby -v`
		- This will now display the version of Ruby running on your system. With rbenv install you can install many versions of Ruby and use them all, on the same system, safely if needed.
- Pull down our test project:
	- `mkdir ~/workspace`
	- `cd ~/workspace`
	- `git clone https://github.com/trcollinson/AgileRootsRuby.git`
	- `cd ~/workspace/AgileRootsRuby`
		- These commands will make a folder called workspace to keep your projects in, and download the AgileRootsRuby project into an AgileRootsRuby folder: `~/workspace/AgileRootsRuby/`
- Install bundler, a Ruby Gem management tool:
	- `gem install bundler`
- Run bundler to get project dependencies automatically:
	- `bundle`
- Run rspec to see the tests run and start fixing failed tests:
	- `rspec`

###Just the Instructions###	

- Download and install Ubuntu 14.04 LTS with updates and 3rd party drivers
- `sudo apt-get install git`
- `sudo apt-get install libssl-dev`
- `git clone https://github.com/sstephenson/rbenv.git ~/.rbenv`
- `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
- `echo 'eval "$(rbenv init -)"' >> ~/.bashrc`
- `source ~/.bashrc`
- `type rbenv`
- `git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`
- `rbenv install 2.1.2`
- `rbenv global 2.1.2`
- `ruby -v`
- `mkdir ~/workspace`
- `cd ~/workspace`
- `git clone https://github.com/trcollinson/AgileRootsRuby.git`
- `cd ~/workspace/AgileRootsRuby`
- `gem install bundler`
- `bundle`
- `rspec`
