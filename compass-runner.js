#!/usr/bin/env node
/*
	This script finds compass config files and starts compass watching each respective set of scss files.
	cd into the project root or set the projectPath variable (in the environment or directly below)
	run the script

	The steps, commands and notes I used to setup compass (with Homebrew):
	% brew install rbenv rbenv-gemset ruby-build openssl
	% rbenv install 2.0.0-p247
	% brew cleanup --force
	% cd to/the/desired/root/directory/
	% rbenv local 2.0.0-p247
	% echo specialgemsetname > .rbenv-gemsets
	% gem install compass sass

	now find the config.rb files, cd into each location and run compass (optional --trace for stacktrace):
	% find . -name config.rb
	% cd to/the/found/location/
	% compass compile --trace -I "~/.rbenv/versions/2.0.0-p247/gemsets/specialgemsetname/gems/compass-0.12.2/frameworks/compass/stylesheets"
	to watch for changes instead use that option:
	% compass watch --trace -I "~/.rbenv/versions/2.0.0-p247/gemsets/specialgemsetname/gems/compass-0.12.2/frameworks/compass/stylesheets"

	in case you prefer to use sass directly I've used this in the past:
	% cd the/dir/ && scss --update <scss-source-dir>:<css-destination-dir>
	to continue watching instead do: scss --update --watch scss:css

	my compass @imports are at something like ~/.rbenv/versions/2.0.0-p247/gemsets/specialgemsetname/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/css3/_box-shadow.scss
	
	more compass details:
	http://compass-style.org/help/tutorials/configuration-reference/
	http://compass-style.org/help/tutorials/command-line/
	http://compass-style.org/help/tutorials/production-css/
		
	currently the config.rb files look like, note the line_comments option:
	# Set this to the root of your project when deployed:
	project_path = '.'
	http_path = '/'
	css_dir = 'css'
	sass_dir = 'sass'
	images_dir = 'images'
	javascript_dir = '../common/js'
	
	preferred_syntax = :scss
	
	# You can select your preferred output style here (can be overridden via the command line):
	output_style = :compact
	
	# To enable relative paths to assets via compass helper functions. Uncomment:
	relative_assets = true
	
	# To disable debugging comments that display the original location of your selectors. Uncomment:
	line_comments = true
	
	sass_options = {:cache => false, :always_update => true}
	
	# If you prefer the indented syntax, you might want to regenerate this
	# project again passing --syntax sass, or you can uncomment this:
	# preferred_syntax = :sass
	# and then run:
	# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
*/


var exec = require('child_process')
,projectPath = (process.env.projectPath || '')
,spawn = exec.spawn
,exec = exec.exec
,sub = []

process.on('SIGINT', function (){
	console.log(' --closing');
	var child;
	while(child = sub.shift()){
		child.kill('SIGHUP');
	};
	console.log(' --finished');
});
if(projectPath) process.chdir( projectPath );
console.log('find compass configs in '+process.cwd());

exec('gem environment && gem list compass', function(error, stdout, stderr){
	if(error) return;
	var compassimports = stdout.replace(/^[\s\S]+INSTALLATION DIRECTORY: ([^\n\r]+)[\s\S]+compass \(([0-9.]+)\)[\s\S]*/m, '$1/gems/compass-$2/frameworks/compass/stylesheets/');
	exec('find . -name config.rb',
		function (error, stdout, stderr){
			var child, opt = ['watch', '--force', '--trace', '-I', compassimports ];
			if (error) return;
			stdout = stdout.split(/config.rb[\n\r]*/);
			stdout.pop();
			while(child = stdout.shift()){
				console.log('starting compass watch in '+child);
				console.log('> compass '+opt.join(' '));
				child = spawn('compass' , opt, {cwd: child});
				child.stdout.on('data', function (data) {
					console.log(' > '+data);
				});
				child.on('close', function (code) {
					console.log('- close '+(code || ''));
				});
				sub.push(child);
			};
	});
});
