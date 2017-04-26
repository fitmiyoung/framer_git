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

m1.x = -10
# print m2.x
btn1.onClick ->
	print m2.x
	m2.x = -10
	m1.x = 692

btn2.onClick ->
	m1.x = -10
	m2.x = 692
	

