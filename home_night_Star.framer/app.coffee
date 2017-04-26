# Import file "Weathers_newColor_Nightnight"
psd = Framer.Importer.load("imported/Weathers_newColor_Nightnight@1x")


Utils.globalLayers psd


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

# star1.sparkle()
# sstar3.sparkle()
# star6.sparkle()

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


psd.cloud.x = -400

# psd.cloud.animate
# 	properties: 
# 		x: 0
# 	curve: "spring-dho(800, 200, 10, 0.01)"
# 

c = new Animation
	layer: psd.cloud
	properties: 
		x: 600
# 		curve: 'ease-out'
	time: 45
	
	
d = c.reverse()

c.on(Events.AnimationEnd, d.start)
d.on(Events.AnimationEnd, c.start)

c.start()
