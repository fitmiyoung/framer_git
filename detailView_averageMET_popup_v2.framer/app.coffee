# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "detailView2_guide_MET관련운동"
sketch = Framer.Importer.load("imported/detailView2_guide_MET관련운동@1x")

Utils.globalLayers sketch
Framer.Defaults.Animation = curve: "spring(300,150,0)"

list_averageMET.opacity = 0

icon_icon.states.add
	a:
		scale: 1
	b:
		scale: 0.6

icon_icon.ani = () ->
	icon_icon.states.next("a","b")

Utils.interval 0.8, ->
	icon_icon.ani()

dots = [dotLine_1,dotLine_2,dotLine_3]
for dot in dots
	dot.opacity = 0
	dot.animationOptions =
		curve: "spring"

dotLine_1.states.add
	a: 
		opacity: 0
	b:
		opacity: 1
	c:
		opacity: 0
dotLine_2.states.add
	a: 
		opacity: 0
	b:
		opacity: 1
	c:
		opacity: 0
dotLine_3.states.add
	a: 
		opacity: 0
	b:
		opacity: 1
	c:
		opacity: 0

jump_arrow_r.onClick ->
	dotLine_1.states.next("b","a","c")
	dotLine_2.states.next("a","b","c")
	dotLine_3.states.next("a","c","b")

#평균메트의 관련 운동 팝업 띄우기 
met_list.opacity = 1

scroll = new ScrollComponent
	y:656
	height: 486
	width: 640
	scrollHorizontal: false
	contentInset: 
		top: -660
		bottom: 20	
met_list.parent = scroll.content
scroll.y = 656*2

#팝업 열기 
icon_averageMET.onClick ->
	list_averageMET.opacity = 1
	scroll.opacity = 1
	scroll.y = 656
	icon_averageMET.opacity = 0
	table.opacity = 0

averageMET_close.onClick ->
	list_averageMET.opacity = 0
	scroll.opacity = 0
	scroll.y = 656*2
	icon_averageMET.opacity = 1
	table.opacity = 1






