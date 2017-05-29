# Import file "step_framer"
sketch = Framer.Importer.load("imported/step_framer@1x")

Utils.globalLayers sketch
Framer.Defaults.Animation = curve: "Bezier.easeIn"

scroll = new ScrollComponent
	y: 123
	height: 1011
	width: 640
scroll.scrollHorizontal = false

# content.parent의 content는 내가 만든 content 그룹명을 의미함. 
#scroll.content는 Scroll의 전체를 쓰겠다는 뜻 
 
content.parent = scroll.content
content.y = 0


tick = new Layer
	width: 22
	height: 146
	image: "images/tick.png"
	x: 404
	y: 568
	opacity: 0

steps = new Layer
	width: 640
	height: 140
	image: "images/steps.png"
	y: 170
	opacity: 0

select_time = new Layer
	width: 640
	height: 50
	image: "images/select_time.png"
	opacity: 0
	y: 123


bar_graph.onClick ->
	tick.opacity = 1
	steps.opacity = 1
	select_time.opacity = 1
	tick.y = 310
	content.y = -250
	
	
scroll.onSwipeUpEnd ->
	tick.opacity = 0
	steps.opacity = 0
	select_time.opacity = 0	
	
scroll.onSwipeDown ->
	content.y = 0
	tick.opacity = 0
	steps.opacity = 0
	select_time.opacity = 0	




