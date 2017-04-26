# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""


# Import file "detailView2_guide_news"
sketch = Framer.Importer.load("imported/detailView2_guide_news@1x")

Utils.globalLayers sketch

page = new PageComponent
	width: 640
	height: 140
	y: 567
	scrollVertical: false
	
lists = [list, list2, list3]	
for i in lists
	i.y = 567 * 2
# 	i.x = i * 641
# 	superLayer: page.content

page.addPage list
page.addPage list2
page.addPage list3

page.snapToPage list, false

allIndicators = []
for i in [0...3]
	indicator = new Layer
		backgroundColor: "#222"
		width: 10, height: 10
		x: 28 * i, y: 680
		borderRadius: "50%", opacity: 0.2
	indicator.x += (Screen.width/2) - (12 * 3)

	indicator.states.add
		active:
			opacity:0.6 
			scale: 1.2
	allIndicators.push(indicator)

page.snapToPage(page.content.subLayers[0])
current = page.horizontalPageIndex(page.currentPage)
allIndicators[current].states.switch("active")
page.animationOptions = curve: "spring(200,22,0)"

	
page.on "change:currentPage", ->
	indicator.states.switch("default") for indicator in allIndicators
	
	current = page.horizontalPageIndex(page.currentPage)
	allIndicators[current].states.switch("active")
	
# 	page.previousPage.animate
# 		properties: 
# 			scale: 0.75
# 			curve: "spring", curveOptions: {tension: 100, friction: 50, velocity: 0, tolerance: 1}
# 	page.previousPage.once Events.AnimationEnd, ->
# 		this.scale = 1
# 		
			