# Import file "framer_ANDROID_MET_v2green copy 3"
psd = Framer.Importer.load("imported/framer_ANDROID_MET_v2green copy 3@1x")
# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: "Device:Nexus"

Framer.Defaults.Animation = curve: "spring(400, 30, 0)"

Utils.globalLayers psd
text.visible = false

scroll = new ScrollComponent
	width: 1080
	height: 765
	y: 1155
scroll.scrollHorizontal = false

scroll.states.add
	ex:
		height: scroll.y - 100
		y: scroll.y - 300
	
bottom = new Layer
	width: 1080
	height: 1641
	image: "images/bottom.png"
	parent: scroll.content
	
top = new Layer
	width: 1080
	height: 186
	image: "images/top.png"
	y: 984
top.states.add
	ex: 
		y: top.y - 300


graph.states.add
	a:
		scale: 0.6
		opacity: 1
		y: -100
		
scroll.onSwipeUpEnd ->
	scroll.states.switch("ex")
	top.states.switch("ex")
	graph.states.switch("a")
graph.onSwipeDown ->
	scroll.states.switch("default")
	top.states.switch("default")	
	graph.states.switch("default")
# graph.on Events.Click, ->
# 	scroll.states.switch("default")
# 	top.states.switch("default")	
# 	graph.states.switch("default")	