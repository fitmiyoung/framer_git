# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "calendar"
sketch = Framer.Importer.load("imported/calendar@1x")



Utils.globalLayers sketch

achieve_copy_6_sel.opacity = 0
toolTip.opacity = 0
toolTip.y = 684+50
print toolTip.y
# achieve_copy_6_sel.onClick ->
# 	toolTip.opacity = 1
# 	toolTip.y = 684
# 	time = 2
# 	achieve_copy_6.opacity = 0
# 	achieve_copy_6_sel.opacity = 1
# 

ani = new Animation toolTip,
	y: 684-2
	opacity: 1
	options:
		time: 0.4
		curve: "bezier-curve(0.25, 0.1, 0.25, 1)"


ani2 = ani.reverse()

ani.start()

Utils.delay 2, ->
	ani2.start()
	
# ani2 = new Animation toolTip,
# 	y: 684+50
# 	opacity: 0
# 	options:
# 		time: 1

# ani.on Events.AnimationEnd, ->
# 	ani2.start()
