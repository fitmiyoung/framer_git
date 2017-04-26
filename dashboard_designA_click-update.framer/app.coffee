# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""

Framer.Extras.Hints.enable()
Framer.Extras.Hints.showHints()

backgroundA = new BackgroundLayer
	backgroundColor: "#efedee"
	
home = new Layer
	width: 1322
	height: 902
	image: "images/home.jpg"
	x: Align.center()

scroll = new ScrollComponent
	width: 1400
	height: 900
	x: Align.center()

scroll.states.add
	open:
# 		y: 0
		opacity: 1
	close:
# 		y: 900
		opacity: 0
		
scroll.scrollHorizontal = false
		
sub = new Layer
	parent: scroll.content
	width: 1322
	height: 1025
	image: "images/sub.jpg"
	x: Align.center()
	
home.onClick ->
	scroll.states.switch "open"
	home.opacity = 0 

back = new Layer
	x: 102
	width: 290
	height: 174
	opacity: 0.00

back.onClick ->
	scroll.states.switch "close"
	home.opacity = 1
		
