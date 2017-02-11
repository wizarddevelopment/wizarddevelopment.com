# Wizard Development.com

[![Greenkeeper badge](https://badges.greenkeeper.io/wizarddevelopment/wizarddevelopment.com.svg?token=1b7050eec6dad9a1a007beb57efedd6bfecdc13491f5832ec6ea02af67ec72ec)](https://greenkeeper.io/)

This is primarily a rails app, but now uses react too!

## Deployment

Because of react we now need to have 2 buildpacks! "What the what!?" you say? We need ruby of course but we also need nodejs to build the react stuff and do a `npm install` during the build phase. This is easy

 - First we switch to use the [`heroku-buildpack-multi`](https://github.com/heroku/heroku-buildpack-multi) buildpack by running `heroku buildpacks:set https://github.com/heroku/heroku-buildpack-multi.git`
 - Then we create a `.buildpacks` file with both the node and ruby buildpacks in it.

