# Import file "step"
sketch = Framer.Importer.load("imported/step@1x")

Utils.globalLayers sketch

total_step1.y = 150

bar_graph.onClick ->
	step_2.x = 0

	sketch.total_step1.animate
		y: 229
		options:
			time: 1
			curve: Spring
	
	

time_line1.onClick ->
	step_2.x = 641
	total_step1.y = 150
	