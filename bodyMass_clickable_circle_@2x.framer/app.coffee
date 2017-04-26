# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "weight" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/weight@2x")


# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


Utils.globalLayers sketch
b_default.x = -20
# 
# texts = [text_bmi, text_bone, text_muscle, text_weight]
# texts.opacity = 0

text_bmi.opacity = 0
text_bone.opacity = 0
text_muscle.opacity = 0
text_weight.opacity = 1
text_fat.opacity = 0
text_water.opacity = 0

icon_muscle_sel.opacity = 0
icon_water_sel.opacity = 0
icon_Fat_sel.opacity = 0
icon_bmi_sel.opacity = 0
icon_skull_sel.opacity = 0
icon_weight_sel.opacity = 1

icon_weight.onClick ->
	icon_muscle_sel.opacity = 0
	icon_water_sel.opacity = 0
	icon_Fat_sel.opacity = 0
	icon_bmi_sel.opacity = 0
	icon_skull_sel.opacity = 0
	icon_weight_sel.opacity = 1	
	text_bmi.opacity = 0
	text_bone.opacity = 0
	text_muscle.opacity = 0
	text_weight.opacity = 1
	text_fat.opacity = 0
	text_water.opacity = 0

icon_muscle.onClick ->
	icon_muscle_sel.opacity = 1
	icon_water_sel.opacity = 0
	icon_Fat_sel.opacity = 0
	icon_bmi_sel.opacity = 0
	icon_skull_sel.opacity = 0
	icon_weight_sel.opacity = 0	
	text_bmi.opacity = 0
	text_bone.opacity = 0
	text_muscle.opacity = 1
	text_weight.opacity = 0
	text_fat.opacity = 0
	text_water.opacity = 0
	
icon_water.onClick ->
	icon_muscle_sel.opacity = 0
	icon_water_sel.opacity = 1
	icon_Fat_sel.opacity = 0
	icon_bmi_sel.opacity = 0
	icon_skull_sel.opacity = 0
	icon_weight_sel.opacity = 0	
	text_bmi.opacity = 0
	text_bone.opacity = 0
	text_muscle.opacity = 0
	text_weight.opacity = 0
	text_fat.opacity = 0
	text_water.opacity = 1

icon_fat.onClick ->
	icon_muscle_sel.opacity = 0
	icon_water_sel.opacity = 0
	icon_Fat_sel.opacity = 1
	icon_bmi_sel.opacity = 0
	icon_skull_sel.opacity = 0
	icon_weight_sel.opacity = 0	
	text_bmi.opacity = 0
	text_bone.opacity = 0
	text_muscle.opacity = 0
	text_weight.opacity = 0
	text_fat.opacity = 1
	text_water.opacity = 0
	
icon_bmi.onClick ->
	icon_muscle_sel.opacity = 0
	icon_water_sel.opacity = 0
	icon_Fat_sel.opacity = 0
	icon_bmi_sel.opacity = 1
	icon_skull_sel.opacity = 0
	icon_weight_sel.opacity = 0	
	text_bmi.opacity = 1
	text_bone.opacity = 0
	text_muscle.opacity = 0
	text_weight.opacity = 0
	text_fat.opacity = 0
	text_water.opacity = 0

icon_skull.onClick ->
	icon_muscle_sel.opacity = 0
	icon_water_sel.opacity = 0
	icon_Fat_sel.opacity = 0
	icon_bmi_sel.opacity = 0
	icon_skull_sel.opacity = 1
	icon_weight_sel.opacity = 0	
	text_bmi.opacity = 0
	text_bone.opacity = 1
	text_muscle.opacity = 0
	text_weight.opacity = 0
	text_fat.opacity = 0
	text_water.opacity = 0
