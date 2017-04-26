# Import file "iphone_home_MET_framer"
psd = Framer.Importer.load("imported/iphone_home_MET_framer@1x")

# Framer.Defaults.Animation =
# 	curve: "spring(300,0,0)"

psd.goal_text.opacity = 0
psd.range.opacity = 0

psd.range.states.add
	stateA:
		opacity: 1
	stateB:
		opacity: 0
psd.goal_text.states.add
	stateA:
		opacity: 1
	stateB:
		opacity: 0
help = new Layer
	y: 877
	width: 640
	height: 97
	opacity: 0.00
	borderWidth: 1
	borderColor: "rgba(255,255,255,1)"
	
help.states.add
	stateA:
		backgroundColor: "#e56244"

psd.range.animate
	properties: 
		opacity: 1
	time: 2

psd.goal_text.animate
	properties: 
		opacity: 1
	time: 1
		
psd.range.on Events.AnimationEnd, ->
	psd.range.states.next("stateB")
	psd.goal_text.states.next("stateB")
	
psd.goal.onClick (event, layer) ->
	psd.range.states.next("stateA")
	psd.goal_text.states.next("stateA")
