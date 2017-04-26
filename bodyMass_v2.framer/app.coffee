# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "weight"
sketch = Framer.Importer.load("imported/weight@1x")

Utils.globalLayers sketch

iPhone_6_home2_Copy_3.x = 0

group_table.opacity = 1

bg.x = 28

# group_table.draggable.enabled = true

scroll = new ScrollComponent
	y: 310
	width: 640
	height: 529
	scrollHorizontal: false

scroll.contentInset = 
	top: -310 * 2

group_table.parent = scroll.content

# scroll.scrollPoint = 
# 	y: 305 

# scroll.on Events.DragMove, ->
# 	if group_table.y < 300
# 		group_table.opacity = 0.3
	
# 	
scroll.onScroll ->
	if scroll.content.scrollY < 308
		scroll.content = -310 * 2


    
# scroll.content.on "change:y", ->
# # 	group_table.y = -140
# 	if group_table.y < 305+100
# 		group_table.y = -140
# 		

print group_table.y


