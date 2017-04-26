# Import file "array_floatButton"
psd = Framer.Importer.load("imported/array_floatButton@1x")


Framer.Defaults.Animation = curve: "spring(300, 30, 0)"


options = psd.options.children
faces = []
originalYs = []

for option in options
	faces.push(option.children[1])
	originalYs.push(option.y += 10)	
	option.opacity = 0
	
# faces = (option.children[1] for option in options)


for face, i in faces
	face.animate
		properties:
			scale: 1
		delay: 0.04 * i
		
psd.btn.onClick ->
		
	for option, i in options
		option.animate
			properties: 
				y: option.y - 10
				opacity: 1
			delay: 0.04 * i
		
# 	for face, i in faces
# 		face.animate
# 			properties:
# 				scale: 1
# 			delay: 0.04 * i

		

	