# Import file "gallery2"
sketch = Framer.Importer.load("imported/gallery2@1x")

scroll = ScrollComponent.wrap sketch.content

scroll.contentInset =
	bottom: sketch.bottom.height

scroll.scrollHorizontal = false
scroll.propagateEvents = false

images = [sketch.img1, sketch.img2, sketch.img3, sketch.img4, sketch.img5, sketch.img6, sketch.img7, sketch.img8, sketch.img9, sketch.img10, sketch.img11, sketch.img12, sketch.img13, sketch.img14, sketch.img15, sketch.img16, sketch.img17, sketch.img18, sketch.img19, sketch.img20]

content = [
	scroll
	sketch.top
	sketch.bottom
]

for image in images
	image.borderRadius = 50
	
	
	image.on Events.Click, (event, layer) ->
		
		if not scroll.isMoving
		
			currentImage = layer.copy()
			currentImage.placeBehind sketch.top
			currentImage.frame = layer.screenFrame
			layer.visible = false
			
			for image in images
				image.ignoreEvents = true
				
			currentImage.animate
				properties:
					scale: Screen.width / currentImage.width
					midY: Screen.height / 2
					midX: Screen.width / 2
				curve: "spring(240,20,0)"
				
			for layerToHide in content
				layerToHide.animate
					properties:
						opacity: 0
					time: 0.2
					
			 # Return to the default view		
			currentImage.on Events.Click, ->
				this.animate
					properties: 
						scale: 1
						x: layer.screenFrame.x
						y: layer.screenFrame.y
					time: 0.3
					
				# Remove image copy  	
				this.on Events.AnimationEnd, ->
					layer.visible = true
					currentImage.destroy()
					
				# Show elements	
				for layerToShow in content
					layerToShow.animate
						properties:
							opacity:1
						time: 0.2
						
				# Remove the ignoreEvents property
				image.ignoreEvents = false for image in images
				
				
