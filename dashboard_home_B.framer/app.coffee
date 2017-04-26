# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


scroll = new ScrollComponent
	width: 1440
	height: 900
scroll.scrollHorizontal = false

a = new Layer
	parent: scroll.content
	width: 1718
	height: 1057
	image: "images/04_dashboard_mediacab_v4.jpg"
	x: -139
