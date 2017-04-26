Framer.Defaults.Animation = curve: "spring(300, 30, 0)"

bg = new Layer
	width: 640
	height: 1136
	image: "images/bg.png"

popup = new Layer
	width: 640
	height: 397
	image: "images/popupbg.png"
	y: 1136
	opacity = 0	
	
tooltip_icon = new Layer
	width: 1310
	height: 179
	image: "images/tooltip_icon.png"
	y: 928
	x: 0
	
tooltip_icon.visible = false
tooltip_icon.states.add
	a: 
		x: 0
		curve: "easy-out"
	b: 
		x: -1640	

popup.states.add
	on:
		y: 735
		
text_15km = new Layer
	parent: popup
	width: 127
	height: 90
	image: "images/text_15km.png"
	x: 247
	y: 84
	
scroll = ScrollComponent.wrap(tooltip_icon)
scroll.scrollVertical = false 
scroll.scrollX = 890

bg.on Events.Click, ->
	tooltip_icon.visible = true
	tooltip_icon.states.next("a", "b")
	popup.states.next()
