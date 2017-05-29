# Import file "step_framer"
sketch = Framer.Importer.load("imported/step_framer@1x")
Utils.globalLayers sketch

Framer.Defaults.Animation =
    curve: "spring(300,40,0)"


scroll = new ScrollComponent
	width: 640
	height: 963
	y: 173
# 	opacity: 0
	visible: false
scroll.scrollHorizontal = false

scroll.states.add
	a: 
		visible:false
	b: 
		visible:true


#step_3: 막대 선택시 서브 화면 화면  		
step_3 = new Layer
	width: 640
	height: 1342
	image: "images/step_3.png"
	parent: scroll.content

step_3.states.add
	a: 
		opacity:0
	b: 
		opacity:1
	
	
#선택한 시간 
select_time = new Layer
	width: 640
	height: 50
	image: "images/select_time.png"
	y: 122
	opacity: 0

select_time.states.add
	a: 
		opacity:0
	b: 
		opacity:1
	

bar_graph.onClick ->
	scroll.states.switch("b")
	select_time.states.switch("b")

scroll.onSwipeDownEnd ->
	scroll.states.switch("a")
	select_time.states.switch("a")



