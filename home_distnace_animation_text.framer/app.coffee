# Import file "home_distance3"
psd = Framer.Importer.load("imported/home_distance3@1x")


psd.popup.opacity = 0



psd.text_length.on Events.Click, ->
	psd.popup.animate	
		properties: 
			opacity: 1
		curve: "spring(500,20,0)"	 


popup = new Animation
	layer: psd.popup
	properties: 
		opacity: 1

popupDestroy = new Animation
	layer: psd.popup_title
	properties: 
		opacity: 0



psd.text_good.
	opacity = 0
	
psd.text_distance.
	opacity = 0

psd.icon_map.
	scale = 0.8

animationIcon = new Animation
	layer: psd.icon_map
	properties: 
		scale: 1.1
	curve: "spring(500,20,0)"	 

animationIconGone = new Animation
	layer: psd.icon_map
	properties: 
		opacity: 0.2
	curve: "spring(200,20,0)"
# 	delay: 1	
	
animationDistance = new Animation
	layer: psd.text_distance
	properties: 
		opacity: 1
		scale: 1.1
	curve: "spring(900,50,0)"	 


# psd.text_distancetop.opacity = 1

aniTop = new Animation
	layer: psd.text_distancetop
	properties: 
		opacity: 0
	delay: 1.2	
	curve: "spring(500,50,0)"	 
	
		
aniTop.start()

aniTop2 = new Animation
	layer: psd.text_good
	properties: 
		opacity: 1
	curve: "spring(100,50,0)"	 


aniTop.on Events.AnimationEnd, ->
	aniTop2.start()		



animationMessage = new Animation
	layer: psd.text_distnacetop
	properties: 
		opacity: 0
		scale: 1.5
	curve: "spring(100,50,0)"	 

animationMessage.start()

animationMessage2 = new Animation
	layer: psd.text_good
	properties: 
		opacity: 1
	curve: "spring(900,50,0)"	 
	

animationIcon.start()

animationIcon.on Events.AnimationEnd, ->
	animationIconGone.start()

animationIconGone.on Events.AnimationEnd, ->
	animationDistance.start()


