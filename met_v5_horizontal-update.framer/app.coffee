# Import file "framer_ANDROID_home_MET_horizontalhorizontal"
psd = Framer.Importer.load("imported/framer_ANDROID_home_MET_horizontalhorizontal@1x")

pageg = new PageComponent
	y: 76
	width: 1080
	height: 1004
	scrollVertical: false

pageg.addPage(psd.Group_1)
pageg.addPage(psd.Group_2)
pageg.addPage(psd.Group_3)

# scroll = new ScrollComponent
# 	x: 1080
# 	y: 76
# 	height: 1004
# 	width: 840
# scroll.scrollHorizontal = false

# 
# list = new PageComponent
# 	x: 1080
# 	y: 76
# 	height: 1004
# 	width: 840
# 	scrollVertical: false
# 	
# list.addPage(psd.date_1)
# list.addPage(psd.date_2)
# list.addPage(psd.date_3)


page = new PageComponent
	scrollVertical: false
	x: 1080
	y: 75
	width: 840
	height: 1005
	backgroundColor: "rgba(255,0,128,0.23)"
	directionLock: true
page.originY = 0

#page Content
containers = []
for i in [0...5]
	layer = new Layer
		width: 840
		height: 899
		x: ( page.width + 20 )* i
		backgroundColor: "rgba(0,0,128,1)"
		parent: page.content
		y: 120
	containers.push(layer)

# scroll content
for container in containers
	scroll = new ScrollComponent
		parent: container
		width: page.width
		height: page.height - 105
		scrollHorizontal: false
		directionLock: true
		
	#scroll안의 리스트 배열 
	for i in [0..10]
		layer = new Layer
			parent: scroll.content
			width: Screen.width - 300
			y: 20 +(layer.height + 30 ) * i
			image: "images/list.png"

pageg.on Events.Swipe, (event) ->
	page.swipe
