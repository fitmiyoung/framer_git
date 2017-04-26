# Import file "activity_intensityTable_framer"
psd = Framer.Importer.load("imported/activity_intensityTable_framer@1x")

Utils.globalLayers(psd)

search.visible = false
list.visible = false



scroll = new ScrollComponent
	y: 295
	width: 640
	height: 843
# 	directionLock: true
	scrollHorizontal: false



lists = new Layer
	width: 640
	height: 6342
	image: "images/lists_long.jpg"
	parent: scroll.content
	x: 1
	y: -2

#스크롤 시작점
scroll.scrollY = 750

layerA = new Layer
	x: 1
	y: 127
	width: 640
	height: 166
	opacity: 0.00
	
layerA.on Events.Click, ->
	scroll.scrollY = 750

# current.on Events.Click, ->
# 	scroll.Y = 750
	
program = new Layer
	width: 640
	height: 1305
	image: "images/program.jpg"

btn = new Layer
	x: 1
	y: 545
	width: 320
	height: 319
	backgroundColor: "rgba(123,123,123,0)"

back = new Layer
	x: -1
	y: -143
	width: 89
	height: 89 
	backgroundColor: "rgba(123,123,123,0)"
	
btn.on Events.Click, ->
	program.y = 1136
	back.x = 1
	back.y = 43


back.on Events.Click, ->
	program.y = 0



popup = new Layer
	width: 640
	height: 1136
	image: "images/popup_exerciseProgram.jpg"

btn_popup = new Layer
	x: 67
	y: 730
	height: 118
	width: 502
	backgroundColor: "rgba(123,123,123,0)"
	
btn_popup.on Events.Click, ->
	popup.y = 1136
	btn_popup.y = 1136
	program.y = 1136
	
btn_back = new Layer
	x: 1
	y: 40
	width: 108
	height: 87
	backgroundColor: "rgba(123,123,123,0)"

btn_back.on Events.Click, ->
	program.y = 0



