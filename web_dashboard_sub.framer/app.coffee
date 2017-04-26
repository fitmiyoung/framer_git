# Import file "Framer_dashboard_v5"
psd = Framer.Importer.load("imported/Framer_dashboard_v5@1x")

{ViewNavigationController} = require "ViewNavigationController"

Utils.globalLayers psd

vnc = new ViewNavigationController


home.parent = vnc
home.x = 0

subpage.parent = vnc
subpage.x = -1441

Framer.Defaults.Animation = curve: "spring(100,10,0)"

# home
cell_1_over.opacity = 0
cell_1_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0

cell_1.states.add
	on:
		opacity: 1
	off:
		opacity: 0 
week.on Events.MouseOver, ->
	print "mouseover"
	cell_1.states.switch("off")
	cell_1_over.states.next("on")
week.on Events.MouseOut, ->
	print "mouseOut"
	cell_1.states.switch("on")
	cell_1_over.states.next("off")	

# cell_1.parent = vnc
# cell_1.x = 116
# cell_1.y = 472

cell_1.on Events.Click, ->
	subpage.x = 0
	

 	
help.states.add
	on:
		opacity: 1
	off:
		opacity: 0
		
help.x = 210
help.opacity = 0

help.on Events.MouseOver, ->
	print "help Click"
	help.states.switch("on")
help.on Events.MouseOut, ->
	print "help None"
	help.states.switch("off")

backbutton = new Layer
	y: 91
	x: 97
	height: 51
	width: 172
	opacity: 0

backbutton.on Events.Click, ->
	home.x = 0
	home.opacity = 1
	subpage.opacity = 0
	
	
	




