# Import file "home_distance_popup2_framer"
psd = Framer.Importer.load("imported/home_distance_popup2_framer@1x")


Framer.Defaults.Animation = curve: "spring(300, 30, 0)"
psd.tooltip_icon.visible = false

items = new Layer
	width: 5767
	height: 247
	image: "images/items_en_wider3.png"
	y: 889
items.visible=false
items.states.add
	a:
		x:0
	b:
		x: -2060	
psd.popup.y = 1136
psd.popup.states.add
# 	off: 
# 		y: 1136
	on:
		y: 735		
scroll = ScrollComponent.wrap(items)	
scroll.scrollVertical = false
scroll.scrollX = 3732

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
	x: 283
	y: 902
	width: 175
	height: 64
	opacity: 0.00
best.on Events.Click, ->
	psd.text_best.visible = true	
