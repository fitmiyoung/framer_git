# Import file "home_distance_framer4"
psd = Framer.Importer.load("imported/home_distance_framer4@1x")


Utils.globalLayers psd

# set initial values for layers
Framer.Defaults.Animation = curve: "spring(300, 30, 0)"

content_20km.opacity = 0
FAB_sel.opacity = 0
options.opacity = 0
optionBg.opacity = 0

initialIconScale = 0.5

options.states.add
	on: 
		scale: 1
		opacity: 1	

optionBg.states.add
	on: 
		opacity: 1 

FAB.on Events.Click, ->
	options.states.switch("on")
	optionBg.states.switch("on")

# 
# optionsA = options.children
# icons = []
# originalYs = []
# 
# for A in optionsA
# 	icons.push(A.children[1])
# # 	originalYs.push(A.y += )
# 	A.opacity = 0
# 	
# # icons.scale = 0 for A in icons
# 
# icons = (options.children[1] for option in options)
# 
# for icon in icons
# 	icon.scale = 0
# 	icon.states.add
# 		on: scale: 1
# 		
# FAB.onClick ->
# 	for option, i in options
# 		option.animate
# 			properties:
# 				y: option.y - 10
# 				opacity: 1
# 			delay: 0.04 * i
			
			






