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

Framer.Defaults.Animation =
  curve: "spring"
  curveOptions:
    tension: 260
    friction: 30
    velocity: 0
    tolerance: 0.01


layerGroup = [stamp1, stamp2, stamp3, stamp4, stamp5, stamp6, stamp7]

for i in layerGroup
	i.opacity = 0.5
	i.scale = 0
	
	for i, a in layerGroup
		i.animate
			properties:
				scale: 1
				opacity: 1
			delay: 0.25 * a 

$2_3_group.animate
	scale: 1.15
	options:
		time: 1
		curve: "spring(724, 25, 0)"
		delay: 0.25 * 8
		
shine = new Layer
	y: 494
	x: 151
	width: 59
	height: 119
	backgroundColor: "rgba(255,255,255,1)"
	rotation: 29
	opacity: 0.20

shine.animate
	x: 433
	y: 495
	options:
		curve: "ease-in"
		delay: 0.25 * 9
		time: 0.60





# for count in [1..7]
# 	stamps = layerGroup["stamp" + count]
# 	stamps.states.add
# 		start: 
# 			opacity:0
# 			scale: 0.5
# 	stamps.states.switchInstant "start"
# 		
# 
# Utils.delay 1, ->
#   timeFactor = 0.1
#   Utils.delay 1 * timeFactor, -> layerGroup.stamp1.states.next()
#   Utils.delay 0 * timeFactor, -> layerGroup.stamp2.states.next()



# stamp1.scale = 0.5
# stamp1.opacity = 0
# sketch.stamp1.animate
# 	opacity: 1.00
# 	scale: 1.00
# 	options:
# 		curve: "spring(724, 25, 0)"
# 
# 
# stamp2.scale = 0.5
# stamp2.opacity = 0
# sketch.stamp2.animate
# 	opacity: 1.00
# 	scale: 1.00
# 	options:
# 		curve: "spring(724, 25, 0)"
# 		delay: 0.2
# 
# stamp3.scale = 0.5
# stamp3.opacity = 0
# sketch.stamp3.animate
# 	opacity: 1.00
# 	scale: 1.00
# 	options:
# 		curve: "spring(724, 25, 0)"
# 		delay: 0.2 * 2
# 
# stamp4.scale = 0.5
# stamp4.opacity = 0
# sketch.stamp4.animate
# 	opacity: 1.00
# 	scale: 1.00
# 	options:
# 		curve: "spring(724, 25, 0)"
# 		delay: 0.2 * 3
# 
# stamp5.scale = 0.5
# stamp5.opacity = 0
# sketch.stamp5.animate
# 	opacity: 1.00
# 	scale: 1.00
# 	options:
# 		curve: "spring(724, 25, 0)"
# 		delay: 0.2 * 4
# 
# stamp6.scale = 0.5
# stamp6.opacity = 0
# sketch.stamp6.animate
# 	opacity: 1.00
# 	scale: 1.00
# 	options:
# 		curve: "spring(724, 25, 0)"
# 		delay: 0.2 * 5
# 
# stamp7.scale = 0.5
# stamp7.opacity = 0
# sketch.stamp7.animate
# 	opacity: 1.00
# 	scale: 1.00
# 	options:
# 		curve: "spring(724, 25, 0)"
# 		delay: 0.2 * 6








