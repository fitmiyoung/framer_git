# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


page = new PageComponent
	width: Screen.width
	height: Screen.height
	scrollVertical: false
	backgroundColor: "rgba(0,0,0,0.5)"

pageOne = new Layer
	width: page.width
	height: page.height
	parent: page.content
	image: "images/home_a.png"

pageTwo = new Layer
	width: page.width
	height: page.height
	parent: page.content
	image: "images/home_b.png"

page.addPage(pageTwo, "right")

pageThree = new Layer
	width: page.width
	height: page.height
	parent: page.content
	image: "images/sleep_1.png"

page.addPage(pageThree, "right")

sleep_2 = new Layer
	width: 640
	height: 1138
	image: "images/sleep_2.png"
	opacity: 0

# ani = new Animation sleep_1,
pageThree.onClick ->
	sleep_2.opacity = 1
btn = new Layer
	y: 441
	x: 54
	width: 532
	height: 153
	opacity: 0.00
btn.onClick ->
	sleep_2.opacity = 0
	
	
# sleep_2.onClick ->
# 	sleep_2.opacity = 0



# sleep_1 = new Layer
# 	width: 640
# 	height: 1138
# 	image: "images/sleep_1.png"
# 
# 
# sleep_2 = new Layer
# 	width: 640
# 	height: 1138
# 	image: "images/sleep_2.png"
# 	opacity: 0
# 
# flow = new FlowComponent
# flow.showNext(sleep_1, animate: false)
# sleep_1.onClick ->
# 	flow.showNext(sleep_2, animate: false)
# sleep_2.onClick ->
# 	flow.showPrevious(animate: false)
# 	
