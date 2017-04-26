# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "exerciseProgram_News"
sketch = Framer.Importer.load("imported/exerciseProgram_News@1x")

Utils.globalLayers sketch

Framer.Defaults.Animation = curve: "spring"


heart_sel.opacity = 0
thumbs_up_nor.opacity = 0



a = new Animation PHOTO_ADD,
	time: 1
	curve: "spring"
	curveOptions: friction: 20
	scale: 1
		
spread = new Layer
	parent: PHOTO_ADD
	width: 60
	height: 58
	borderRadius: 54
	backgroundColor: "rgba(229,98,68,0.8)"
	scale: 0

spreadAni = new Animation spread,
	scale: 2
	opacity: 0
	time: 5
# 	curveOptions: 
# 		friction: 20


#heart2에 후광주기
spread2 = new Layer
	parent: heart2
	width: 60
	height: 58
	borderRadius: 54
	backgroundColor: "rgba(229,98,68,0.8)"
	x: -13
	y: -16
	scale: 0

spreadAni2 = new Animation spread2,
	scale: 2
	opacity: 0
	time: 10
# 	curveOptions: 
# 		friction: 20


mask_photo = new Layer
	x: 120
	y: 276
	height: 73
	width: 497
	opacity: 1.00
	backgroundColor: "rgba(255,255,255,0.5)"
PHOTOS.parent = mask_photo
PHOTOS.x = 0
PHOTOS.y = 0
mask_photo.clip = true


#more photo
more = new Layer
	image: "images/more.png"
	width: 59
	height: 59
	x: 536
	y: 276
	opacity: 0
	

PHOTO_ADD.opacity = 0.5
# PHOTO_ADD.y = 149 - 70
PHOTO_ADD.scale = 0

mask_add = new Layer
	y: 276
	width: 76
	height: 72
	x: 120
	opacity: 0.96
	backgroundColor: "rgba(255,255,255,0.5)"
	opacity: 0
PHOTO_ADD.parent = mask_add
PHOTO_ADD.x = 0
PHOTO_ADD.y = 0





toggle = new Layer
	y: 356
	x: 110
	width: 96
	height: 61
	opacity: 0

toggle.on Events.Click, ->
	heart_sel.opacity = 1
	heart_nor.opacity = 0
	PHOTO_ADD.opacity = 1
# 	PHOTO_ADD.y = 149
	PHOTOS.x = 80
	a.start()
	spreadAni2.start()
	more.opacity = 1
	mask_photo.width = 497-69
	mask_add.opacity = 1
# 	spread.states.next("a","b")