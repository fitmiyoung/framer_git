# Import file "home_거리_팝업2_framer"
psd = Framer.Importer.load("imported/home_거리_팝업2_framer@1x")

Framer.Defaults.Animation = curve: "spring(300, 30, 0)"

psd.popup.y = 1136
psd.popup.states.add
# 	off: 
# 		y: 1136
	on:
		y: 735	

items = new Layer
	width: 4704
	height: 247
	image: "images/items.png"
	y: 889
# items = new Layer
# 	width: 4671
# 	height: 247
# 	image: "images/items.png"
# 	y: 889	
items.visible = false 		
items.states.add
	a:
		x:0
	b:
		x: -1560	


scroll = ScrollComponent.wrap(items)	
scroll.scrollVertical = false
scroll.scrollX = 3260

psd.bg.on Events.Click, ->
	items.visible = true
	items.states.next("a", "b")	
	psd.popup.states.next() 
# 	print items.y
# 	print items.x
	
psd.text_best.visible = false
psd.text_best.states.add 
	off:
		visible: false
	on:
		visible: true 
best = new Layer
	x: 439
	y: 889
	width: 175
	height: 168
	opacity: 0.00
best.on Events.Click, ->
	psd.text_best.visible = true	
	
	
	


