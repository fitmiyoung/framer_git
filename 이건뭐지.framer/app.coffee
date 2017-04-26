# Import file "framer_home_distance_5_onlyText"
psd = Framer.Importer.load("imported/framer_home_distance_5_onlyText@1x")

# psd.more_copy.states.add
# 	up: 
# 		y: 565 + 10
# 	down:
# 		y: 564
# 		
# psd.more_copy.states.next("up", "down")

ani = new Animation
	layer: psd.more_copy
	properties: 
		y: 569 + 14
	curve: "ease-out"	

ani2 = ani.reverse()

ani.on(Events.AnimationEnd, ani2.start)
ani2.on(Events.AnimationEnd, ani.start)

ani.start()

psd.popup.opacity = 0

psd.bg.onCLick ->
	psd.popup.opacity = 1
			