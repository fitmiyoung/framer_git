# Import file "Weathers_newColor_cloud"
psd = Framer.Importer.load("imported/Weathers_newColor_cloud@1x")
# Import file "Weathers_newColor_Nightnight"
psd2 = Framer.Importer.load("imported/Weathers_newColor_Nightnight@1x")



page = new PageComponent
	width: Screen.width
	height: Screen.height
	scrollVertical: false

page.addPage(psd.days)
page.addPage(psd.sunset)
page.addPage(psd2.night2)

# DAYS
psd.cloud.x = -400
days = new Animation
	layer: psd.cloud
	properties: 
		x: 600
	time: 45
days_reverse = days.reverse()
days.on(Events.AnimationEnd, days_reverse.start)
days_reverse.on(Events.AnimationEnd, days.start)
days.start()

# SUNSET
psd.cloud_s.x = 140
psd.cloud_s.y = 96
c = new Animation
	layer: psd.cloud_s
	properties: 
		x: 0
		y: 70
# 		curve: 'ease-out'
	time: 10


d = c.reverse()
c.on(Events.AnimationEnd, d.start)
d.on(Events.AnimationEnd, c.start)
c.start()

psd.sun.y = -64
psd.sun.states.add
	A:
		y: 29
		time: 4
	B:
		opacity: 0.7	
psd.sun.sunset = () ->
	psd.sun.states.next("A","B")
Utils.interval 0.1, ->
	Utils.delay .4, ->
		psd.sun.sunset()


# NIGHT
Utils.globalLayers psd2

# NIGHT STARTS
stars = [star1,star2,sstar3,star4,star5,star6]
for star in stars
	star.states.add
		fade:
			opacity: 1
		bright:
			opacity: 0	
		scale:
			scale: .9
		scale2:
			scale: .4	
star1.sparkle = () ->
	star1.states.next("scale","scale2")
sstar3.sparkle = () ->
	sstar3.states.next("bright","fade")
star6.sparkle = () ->
	star6.states.next("bright","fade")
star5.sparkle = () ->
	star5.states.next("bright","default")
star2.sparkle = () ->
	star2.states.next("scale2","default")	

Utils.interval 0.25, ->
	Utils.delay 1, ->
		star1.sparkle()
	Utils.delay 0.5, ->
		star6.sparkle()
	Utils.delay 0.1, ->
		sstar3.sparkle()
	Utils.delay 0.9, ->
		star5.sparkle()
	Utils.delay 0.9, ->
		star2.sparkle()

# NIGHT CLOUD MOVING
psd2.cloud2.x = -400
c = new Animation
	layer: psd2.cloud2
	properties: 
		x: 600
	time: 45

d = c.reverse()
c.on(Events.AnimationEnd, d.start)
d.on(Events.AnimationEnd, c.start)
c.start()
