# Import file "iphone_home_MET_framer"
psd = Framer.Importer.load("imported/iphone_home_MET_framer@1x")

Utils.globalLayers(psd)

tick_bg.opacity = 0
# goal.opacity = 0
goal_text.opacity = 0
range.opacity = 0

# expand
tick_bg.opacity = 0
tick_bg.scaleY = 0

tick2.y = 40
tick1.y = 30

tick_bg.animate
	properties:
		opacity: 1
		scaleY: 1
	time: 1
tick2.animate	
	properties:
		y: 0
tick1.animate	
	properties:
		y: 96


# contract
# tick_bg.opacity = 1
# tick_bg.scaleY = 1.5
# 
# tick2.y = -23
# tick1.y = 120
# tick_bg.animate
# 	properties:
# 		opacity: 1
# 		scaleY: 1
# 	time: 1
# 
# tick2.animate	
# 	properties:
# 		y: 0
# tick1.animate	
# 	properties:
# 		y: 96

maskA = new Layer
	x: 50
	y: 840
	height: 249
	width: 0
	opacity: 1.00
	clip: true
	backgroundColor: "rgba(255,123,123,0)"
	
graphline.parent = maskA
graphline.y = 0
	
maskA.animate
	properties: 
		width: 560
	time: 2.5

# I tried to layer 'goal' is made of top of the other layers, but Still maskA layer is top now.. How can I solve this?
goal_text.bringToFront()

range.states.add
	stateA:
		opacity: 1
	stateB:
		opacity: 0
goal_text.states.add
	stateA:
		opacity: 1
	stateB:
		opacity: 0
		
maskA.on Events.AnimationEnd, ->
	range.states.next("stateA")
	goal_text.states.next("stateA")
range.on Events.AnimationEnd, ->
	range.states.next("stateB")
	goal_text.states.next("stateB")