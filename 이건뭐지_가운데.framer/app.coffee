# Import file "framer_이건뭐지_거리"
psd = Framer.Importer.load("imported/framer_이건뭐지_거리@1x")

psd.popup.opacity = 0

ani = new Animation
	layer: psd.help
	properties: 
		y: 572 + 19
	curve: "ease-out"	

ani2 = ani.reverse()

ani.on(Events.AnimationEnd, ani2.start)
ani2.on(Events.AnimationEnd, ani.start)

ani.start()

psd.popup.opacity = 0

psd.bg.on Events.Click, ->
	psd.popup.animate
		properties: 
			opacity: 1