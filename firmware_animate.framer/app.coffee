# Import file "fitmate_set_firware_update_framer"
psd = Framer.Importer.load("imported/fitmate_set_firware_update_framer@1x")


psd.arrow.x = 440
# psd.arrow.animate
# 	properties:
# 		x: 430

psd.arrow.states.add
	aa:
		x: 535
		
Utils.interval 0.8, ->
	psd.arrow.states.next()