Framer.Defaults.Animation = curve: "spring(300, 30, 0)"

friend = new Layer
	width: 640
	height: 1138
	image: "images/friend.jpg"


intro = new Layer
	width: 640
	height: 1136
	image: "images/intro.jpg"
	y: 1136
	
popup = new Layer
	width: 640
	height: 1136
	image: "images/popup.png"
	opacity: 0

btn = new Layer
	y: 1005
	width: 640
	height: 131
	opacity: 0.00

back = new Layer	
	height: 105
	width: 108
	y: 38
	opacity: 0.00

ani = new Animation
	layer: intro	
	properties: 
		y: 0
	delay: 2
		
ani.start()
		
btn.on Events.Click, ->
	popup.opacity = 1
	
back.on Events.Click, ->
	popup.opacity = 1
			