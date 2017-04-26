# Import file "framer_ANDROID_MET_exercisegreen_copy_3-2 copy 3"
psd = Framer.Importer.load("imported/framer_ANDROID_MET_exercisegreen_copy_3-2 copy 3@1x")


Framer.Defaults.Animation = curve: "spring(400, 30, 0)"

# Utils.globalLayers psd

scroll = new ScrollComponent
	y: 1304
	width: 1080
	height: 621
scroll.scrollHorizontal = false

# psd.bottom.parent = scroll.content
psd.bottom.visible = false

bottom = new Layer
	width: 1080
	height: 1587
	image: "images/bottom.jpg"
	parent: scroll.content
	y: 5
	
psd.top.states.add
	up:
		shadowY: 2
		y: -2237
		opacity: 0.8

scroll.states.add
	up:
		y: 629
		height: 1282

scroll.onSwipeUpEnd -> 
	scroll.states.switch("up")
	psd.top.states.switch("up")
scroll.onSwipeDown ->
	scroll.states.switch("default")
	psd.top.states.switch("default")
psd.top.on Events.Click, (event, layer) ->
	scroll.states.switch("default")
	psd.top.states.switch("default")
	
