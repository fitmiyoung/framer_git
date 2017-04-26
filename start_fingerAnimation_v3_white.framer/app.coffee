# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "home_emergecarb_framer"
psd = Framer.Importer.load("imported/home_emergecarb_framer@1x")

Utils.globalLayers psd
Framer.Defaults.Animation = curve: "spring(300, 50, 40)"

	
finger_on_star = new Layer
	width: 66
	height: 51
	image: "images/finger_on_star.png"
	x: 280
	y: 915

finger_on_star.states.add
	off:
		opacity: 0
	on:
		opacity: 1
		y: 915-5
		
finger_on.visible = false
finger_off.states.add
	stateA: 
		y: 934
		scale: 0.9
	stateB:
		y: 934+10
		scale: 1
	
finger_off.function2_1 = () ->
	finger_off.states.next("stateA","stateB")
	finger_on_star.states.next("on","off")
Utils.interval 0.5, ->
	finger_off.function2_1()
	
	
btn_off.states.add
	btnon:
		opacity: 0
	btnon2:
		opacity: 1
btn_off.function3 = () ->
	btn_off.states.next("btnon","btnon2")
Utils.interval 0.5, ->
	btn_off.function3()
	

