# Import file "home_sync_toast_framer"
psd = Framer.Importer.load("imported/home_sync_toast_framer@1x")

a = psd.x
b = psd.device

psd.x.animate
	properties:
		opacity: .2
	curve: "ease-in-out"
	repeat: 90

psd.toast.states.add
	a:
		x: 90
		
psd.x.on Events.AnimationStart, ->
	psd.toast.states.next()

psd.bg.on Events.Click, ->
	psd.x.animateStop()
	psd.toast.opacity = 0
	