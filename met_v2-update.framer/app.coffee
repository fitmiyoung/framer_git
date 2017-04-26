# Import file "framer_ANDROID_MET_v2green copy 3"
psd = Framer.Importer.load("imported/framer_ANDROID_MET_v2green copy 3@1x")


Utils.globalLayers psd
text.visible = false


scroll = new ScrollComponent
	width: 1080
	height: 1130
	y: 790
# 	image: "images/bottom.png"
scroll.scrollHorizontal = false
# text.parent = scroll.content

scroll.states.add
	sa:
		y: 790
	sb:
 		y: 990
 	
top = new Layer
	width: 1080
	height: 186
	image: "images/top.png"
	parent: scroll.content

bottom = new Layer
	width: 1080
	height: 1641
	image: "images/bottom.png"
	parent: scroll.content
	y: 170

top.states.add
	ta: 
		y: 0
	
graph.states.add
	a:
		scale: 0.6
		opacity: 0.5
	b:
		scale: 1
		opacity: 1
# graph.scale = 0.75

# scroll.on Events.ScrollStart, (event, draggable, layer) ->
scroll.onSwipeUpEnd ->
	graph.states.switch("a")
	scroll.states.switch("sa")
# 	if top.x <= 0
# 		top.x.draggable = false
# 	else
# 		top.draggable = true
scroll.onSwipeDownEnd ->
	graph.states.switch("b")
	scroll.states.switch("sb")

# topFix = ->
# 	yOffset = scroll.content.y
# 	if 790 - yOffset > 100
# 		scroll.scrollToTop()
# 	else
# 		scroll.scrollToPoint y: 1130
# 			
# scroll.content.on Events.AnimationEnd, ->
# 	topFix()
# 	print top.y



