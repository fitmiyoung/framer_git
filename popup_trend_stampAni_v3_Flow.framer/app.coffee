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
animation = ->
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


animation()









layerGroup2 = [p2_stamp1, p2_stamp2, p2_stamp3, p2_stamp4, p2_stamp5, p2_stamp6, p2_stamp7]
animation2 = ->
	for i in layerGroup2
		i.opacity = 0.5
		i.scale = 0
		
		for i, a in layerGroup2
			i.animate
				properties:
					scale: 1
					opacity: 1
				delay: 0.25 * a 
	
	p2_2_3_group.animate
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





btn_sel.opacity = 0
btn_firm_sel.opacity = 0

btn.on Events.MouseOver, ->
	btn_sel.opacity = 1
btn.on Events.MouseOut, ->
	btn_sel.opacity = 0
btn.on Events.Click, ->
	btn_sel.opacity = 1
	popup2.x = 0
	animation2()

btn_firm_sel.on Events.MouseOver, ->
	btn_firm_sel.opacity = 1
btn_firm_sel.on Events.MouseOut, ->
	btn_firm_sel.opacity = 0
btn_firm_sel.on Events.Click, ->
	btn_firm_sel.opacity = 1
	popup3.x = 0
	