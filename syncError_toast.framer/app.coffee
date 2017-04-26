# Import file "home_sync_toast_framer"
psd = Framer.Importer.load("imported/home_sync_toast_framer@1x")

a = psd.x
b = psd.device

psd.icon.animate
	properties:
# 		rotation: 180
		opacity: .2
	curve: "ease-out"
	repeat: 990	

psd.toast.states.add
	a:
		x: 90
		
psd.icon.on Events.AnimationStart, ->
	psd.toast.states.next()