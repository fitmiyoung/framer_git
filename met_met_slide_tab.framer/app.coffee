# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


page = new PageComponent	
	width: 1080
	height: 1920	
	scrollVertical: false
page.originY = 0

a = new Layer
	width: 1080
	height: 2741
	image: "images/Artboard 1.png"

b = new Layer
	width: 1080
	height: 2741
	image: "images/Artboard 2.png"

c = new Layer
	width: 1080
	height: 2741
	image: "images/Artboard 3.png"

page.addPage(a)
page.addPage(b)
page.addPage(c)