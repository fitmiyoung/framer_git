# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


sleep_1 = new Layer
	width: 640
	height: 1138
	image: "images/sleep_1.png"


sleep_2 = new Layer
	width: 640
	height: 1138
	image: "images/sleep_3.png"



flow = new FlowComponent
flow.showNext(sleep_1, animate: false)
sleep_1.onClick ->
	flow.showNext(sleep_2, animate: false)
sleep_2.onClick ->
	flow.showPrevious(animate: false)
	