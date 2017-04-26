Framer.Defaults.Animation = curve: "spring(300, 30, 0)"
bg_en = new Layer
	width: 640
	height: 1136
	image: "images/bg_en.png"

page1 = new Layer
	width: 640
	height: 627
	image: "images/page1.jpg"

page2 = new Layer
	width: 640
	height: 627
	image: "images/page2.jpg"

page3 = new Layer
	width: 640
	height: 627
	image: "images/page3.jpg"

page4 = new Layer
	width: 640
	height: 627
	image: "images/page4.jpg"

page5 = new Layer
	width: 640
	height: 627
	image: "images/page5.jpg"

page6 = new Layer
	width: 640
	height: 627
	image: "images/page6.jpg"

page7 = new Layer
	width: 640
	height: 627
	image: "images/page7.jpg"

# pages = [page1, page2, page3, page4, page5, page6, page7]
# for page in pages
# 	page.y = 310
	
pagesC = new PageComponent
	width: 640
	height: 627
	scrollVertical: false
	y: 310
	
pagesC.addPage page1
pagesC.addPage page2
pagesC.addPage page3
pagesC.addPage page4
pagesC.addPage page5
pagesC.addPage page6
pagesC.addPage page7
