# Import file "Framer_dashboard_v5 copy_over"
psd = Framer.Importer.load("imported/Framer_dashboard_v5 copy_over@1x")

# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""

Framer.Extras.Hints.enable()
Framer.Extras.Hints.showHints()
Utils.globalLayers psd

Framer.Defaults.Animation = curve: "spring(100,10,0)"

# cell = [cell_1, cell_2, cell_3, cell_4]
# over = [cell_1_over, cell_2_over, cell_3_over, cell_4_over]
# 
# over.opacity = 0


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

cell_2_over.opacity = 0
cell_2_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0
cell_2.states.add
	on:
		opacity: 1
	off:
		opacity: 0  

cell_3_over.opacity = 0
cell_3_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0
cell_3.states.add
	on:
		opacity: 1
	off:
		opacity: 0
		
cell_4_over.opacity = 0
cell_4_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0
cell_4.states.add
	on:
		opacity: 1
	off:
		opacity: 0 

# bottom		 
cell_5_over.opacity = 0
cell_5_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0
cell_5.states.add
	on:
		opacity: 1
	off:
		opacity: 0  

cell_6_over.opacity = 0
cell_6_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0
cell_6.states.add
	on:
		opacity: 1
	off:
		opacity: 0  

cell_7_over.opacity = 0
cell_7_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0
cell_7.states.add
	on:
		opacity: 1
	off:
		opacity: 0  

cell_8_over.opacity = 0
cell_8_over.states.add
	on:
		opacity: 1
	off:
		opacity: 0
cell_8.states.add
	on:
		opacity: 1
	off:
		opacity: 0  


cell_1.on Events.MouseOver, ->
# 	print "mouseover"
	cell_1.states.switch("off")
	cell_1_over.states.next("on")
cell_1.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_1.states.switch("on")
	cell_1_over.states.next("off")

cell_2.on Events.MouseOver, ->
# 	print "mouseover"
	cell_2.states.switch("off")
	cell_2_over.states.next("on")
cell_2.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_2.states.switch("on")
	cell_2_over.states.next("off")
	
cell_3.on Events.MouseOver, ->
# 	print "mouseover"
	cell_3.states.switch("off")
	cell_3_over.states.next("on")
cell_3.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_3.states.switch("on")
	cell_3_over.states.next("off")

cell_4.on Events.MouseOver, ->
# 	print "mouseover"
	cell_4.states.switch("off")
	cell_4_over.states.next("on")
cell_4.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_4.states.switch("on")
	cell_4_over.states.next("off")

# bottom
cell_5.on Events.MouseOver, ->
# 	print "mouseover"
	cell_5.states.switch("off")
	cell_5_over.states.next("on")
cell_5.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_5.states.switch("on")
	cell_5_over.states.next("off")

cell_6.on Events.MouseOver, ->
# 	print "mouseover"
	cell_6.states.switch("off")
	cell_6_over.states.next("on")
cell_6.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_6.states.switch("on")
	cell_6_over.states.next("off")

cell_7.on Events.MouseOver, ->
# 	print "mouseover"
	cell_7.states.switch("off")
	cell_7_over.states.next("on")
cell_7.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_7.states.switch("on")
	cell_7_over.states.next("off")

cell_8.on Events.MouseOver, ->
# 	print "mouseover"
	cell_8.states.switch("off")
	cell_8_over.states.next("on")
cell_8.on Events.MouseOut, ->
# 	print "mouseOut"
	cell_8.states.switch("on")
	cell_8_over.states.next("off")



