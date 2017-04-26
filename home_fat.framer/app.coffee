# Import file "home_fat_animation"
psd = Framer.Importer.load("imported/home_fat_animation@1x")


psd.icon_fat.y = -100

psd.icon_fat.animate
	properties:
		scale: 1.1
		y: 417
	curve: "spring(200,10,0)"
	
psd.text2.
	opacity = 0	
	y = 700

# psd.text1.opacity = 0

# psd.text2.animate
# 	properties: 
# 		x: 75
		
# psd.text1.animate
# 	properties:
# 		opacity: 1
# 		time: 5

#state 이용  
# psd.text1.states.add
# 	stateA:
# 		opacity: 0
# 		time: 0.5
# 	stateB:
# 		opacity: 1
# 		time: 1			
# 
# psd.text1.onTap ->
# 	psd.text1.states.next()

animationA = new Animation
	layer: psd.text1
	properties:
		opacity: 1
		time: 5

animationA2 = new Animation
	layer: psd.text1
	properties:
		opacity: 0
		
	
animationB = new Animation
	layer: psd.text2
	properties: 
		y: 620
		opacity: 1
				
			
psd.icon_fat.on Events.AnimationEnd, ->
	animationA2.start()
	animationB.start()
	

