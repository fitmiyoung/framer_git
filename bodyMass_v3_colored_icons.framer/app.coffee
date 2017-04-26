# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "weight"
sketch = Framer.Importer.load("imported/weight@1x")

Utils.globalLayers sketch

s1.x = -10

ICON1_Copy_4.onClick ->
	s2.x = -10

ICON11.onClick ->
	s1.x = -10
	s2.x = 640
