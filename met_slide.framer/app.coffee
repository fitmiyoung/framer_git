# Import file "framer_ANDROID_MET_LOGgreen_copy_3-2 copy 3LOG 3 copy 2"
psd = Framer.Importer.load("imported/framer_ANDROID_MET_LOGgreen_copy_3-2 copy 3LOG 3 copy 2@1x")

page = new PageComponent
	scrollVertical: false
	y: 982
	width: 1080
	height: 442

page.addPage(psd.s3)
page.addPage(psd.s2)
page.addPage(psd.s1)


scroll = new ScrollComponent
	y: 1424
	width: 1080
	height: 496
	scrollHorizontal: false

	
psd.bottom.parent = scroll.content
psd.bottom.y = 0





