# OpenSourceRails

Welcome to the new Open Source Rails. We've revamped the site as a simple static site generator for more speed, easier updates, and maintenance by a larger open source community.

## Contributing

### Submitting a new Project

We're managing new project submission via Github Issues. You can also send us a pull request.

[Submit a new Project here](https://github.com/railsjedi/opensourcerails/issues/new?title=Submit%20a%20new%20project&body=Description%20of%20Project)


### Submitting a Blog Post

You can also submit a guest blog post on Open Source Rails about your project (installation instructions, walkthrough guides, tips/tricks). If it's of high quality, we'll merge it in and feature it on our site.

You can either write the blog post as a github issue (in markdown), or fork the code of the site and check it in as blog/posts/[title].md


## Getting it running locally

To help add features, write content, or tweak/fix the site, you can check out the project from github. We're using a static site generated called [Middleman](http://middlemanapp.com)


### Dev Instructions

    git clone git@github.com:railsjedi/opensourcerails.git
    bundle
    bundle exec rake github_data
    bundle exec middleman server -p 3000

You should now be able to access the site locally at <http://localhost:3000>

You can also start [Guard](https://github.com/guard/guard) in a new Terminal tab with `bundle exec guard -g assets`. If you have LiveReload Chrome extension installed, it will automatically update your browser as you make changes.


### Deploying

To deploy to opensourcerails.com, just run:

    bundle exec middleman build;bundle exec middleman deploy;

If you think you should have access to deploy but don't submit a new Github Issue with your SSH public key in it, and we'll add you to the `authorized_keys` on the server.

If you get github exceptions about rate limitations (default is just 60/per hour per ip address), you'll need to authenticate your machine via `.netrc`

    echo 'machine api.github.com login mygithubusername password MyPasswordHere111' >> ~/.netrc

replace `mygithubusername` and `MyPasswordHere111` with your actual github username/password

If this is there, then it shouldn't have a problem with the rate limit (its bumped to 5k/hr).


## Credits

The visual design / styles for this site is copyrighted and not owned by Open Source Rails. We have obtained a license to use it on a single site. If you'd like to use this site for your own purposes, please purchase a license for the design here: [SimpleThings](http://themeforest.net/item/simplething-a-clean-html-template/3149829?ref=jcnetdev).

Aside from the JS and CSS, all other code for this site is licensed under MIT.


