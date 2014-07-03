# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.create(
  name: "Francis Gulotta",
  email: "francis@wizarddevelopment.com",
  twitter: "reconbot",
  github: "reconbot",
  blog: "http://wizard.codes/",
  bio: 'Francis is a long time developer and technologist. He\'s run developement teams for Hedge Funds, Tech Startups, and Private Education. He loves teaching, javascript and robots. And has recently spoken at <a href="http://2014.jsconfbr.org/">JSConf Brazil</a>, <a href="http://jqueryuk.com/">jQuery Conf UK</a> and <a href="http://2014.jsconf.us/">JS Conf US</a>.',
  photo: "francis_gulotta.jpg"
)

Employee.create(
  name: "Hannah Nordgren",
  email: "hannah@wizarddevelopment.com",
  twitter: "hnsayshello",
  github: "ninjaofawesome",
  blog: "http://wizard.codes/",
  bio: "Hannah loves making beautiful products for interesting people.  She enjoys aesthetics both in front of the screen as a designer and behind it as a developer.  She also likes bikes (a lot.)",
  photo: "hannah.jpg"
)

Employee.create(
  name: "Armando Amador",
  email: "armando@wizarddevelopment.com",
  github: "ArmandoAmador",
  blog: "http://wizard.codes/",
  photo: "armando.jpg"
)

Employee.create(
  name: "Amy Gimma",
  email: "amy@wizarddevelopment.com",
  twitter: "amyg225",
  github: "amyg225",
  blog: "http://wizard.codes/",
  photo: "amy.jpg"
)

Employee.create(
  name: "Gustavo Guimares",
  twitter: "gus_tavo_guim",
  email: "gustavo@wizarddevelopment.com",
  github: "gustavoguimaraes",
  blog: "http://wizard.codes/",
  photo: "gus.jpeg"
)
