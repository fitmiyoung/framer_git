# Import file "home_distance_5_popup_test"
psd = Framer.Importer.load("imported/home_distance_5_popup_test@1x")

psd.optionBg.opacity = 0
psd.optionBg.states.add
	on: opacity: 1
	off: opacity: 0
	
psd.icon_close.opacity = 0
psd.icon_close.states.add
	on: opacity: 1
	off: opacity: 0
	
psd.icon_close.states.animationOptions =
    curve: "spring(500, 0, 0)"
    
psd.icon_open.states.add
	on: opacity: 1
	off: opacity: 0
	
psd.icon_open.states.animationOptions =
    curve: "spring(500, 0, 0)"
    
options = [psd.option1, psd.option2]

for option in options
	option.opacity = 0
	
psd.fab.onClick ->
	for option, i in options
		option.animate
			properties:
				opacity: 1
			delay: 0.04 * i
	psd.icon_open.states.switch("off")
	psd.icon_close.states.switch("on")			
	psd.optionBg.states.switch("on")


popup = new Layer
	width: 640
	height: 396
	image: "images/popup.png"
	y: 1740

Framer.Defaults.Animation = curve: "spring(300, 30, 0)"
	
popup.states.add
	on: 
		y: 740
	off: 
		y: 1740
	
		
psd.option2.onClick ->
	popup.states.switch("on")
	psd.optionBg.states.switch("off")
	for option, i in options
		option.animate
			properties:
				opacity: 0
	psd.icon_open.states.switch("on")
	psd.icon_close.states.switch("off")	
	
	
	



# options = psd.options.children
# icons = []
# 
# for option in options
# 	icons.push(option.children[1])
# 	option.opacity = 0.1
# 	
# for icon, i in icons
# 	icon.animate
# 		properties:
# 			scale: 1.1
# 		delay: 0.04 * i 
# 		
# 		
# psd.fab.onClick ->
# 	for option, i in options
# 		option.animate
# 			properties: 
# 				y: option.y - 10
# 				opacity: 1
# 			delay: 0.1 * i 	

