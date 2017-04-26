# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "MiyoungYoon iMac"
	twitter: ""
	description: ""

#인터렉션 의도: 
# 0. cell layer에 마우스 오버하면 cell_over layer가 띄워진다.
# 1. 노란색 버튼(help layer)를 누르면 팝업(pop up)레이어가 띄워진다.
	
cells = []
for i in [0..3]
#FACEOOBK - 이지웅님의 솔루션: 함수로 만들어 변수명 바로 사용하기 (scope)
# https://framerjs.com/getstarted/programming/#scope
	do ->
		cell = new Layer
			width: 231
			height: 140
			image: "images/cell_1.png"
			x: i * 250
		cells.push(cell)
		
	# 	cell.states.animationOptions = time: 0.1
		cell.states.add
			hover:
				opacity: 1
					
		popup = new Layer
			width: 276
			height: 169
			image: "images/popup.png"
			x: 190 + i * 250
			y: 92
			opacity: 0.2
		popup.states.add
			open:
				opacity: 1
			close:
				opacity: 0	
				
	# week를 cell안에 집어넣기
		week = new Layer
			#parent를 이용
			parent: cell
			width: 54
			height: 48
			backgroundColor: "rgba(255,0,128,1)"
			y: 92
			opacity: 0.62
	# 0
		week.states.add
			hover:
				width: 120
				x: Align.left(130)
				opacity: 0.2
	# 1			
		help = new Layer
			parent: cell
			width: 48
			height: 50
			x: 183
			y: 90
			backgroundColor: "rgba(255,255,102,0.7)"
		help.states.add
			hover:
				width: 100
				backgroundColor: "green"	
	# 2		
		cell_over = new Layer
			parent: cell
			width: 231
			height: 140
			image: "images/cell_1_over.png"
			opacity: 0		
		cell_over.states.add
			hover:
				opacity: 0.9	

		help.onClick ->
			popup.bringToFront()
			popup.states.switch "open"
			print "click"
		help.onMouseOut ->
			popup.states.switch "close"
			print "click out"
		
		cell.onMouseOver ->
			cell_over.states.switch "hover"
			print "hover"
		cell.onMouseOut ->
			cell_over.states.switch "default"
			print "out"		


# 	cell.onMouseOver (event, layer)->
# # 		layer.states.switch "hover"
# 		this.children[0].states.switch "hover"
# 		this.children[1].states.switch "hover"
# 		this.children[2].states.switch "hover"
# 	
# 	cell.onMouseOut (event, layer) ->
# 		layer.children[0].states.switch "default" #week
# 		layer.children[1].states.switch "default" #help
# 		layer.children[2].states.switch "default" #cell_over
	

#문제점: help레이어를 누르면, 배열 맨 끝에서 팝업이 열림. 현재 클릭한 help아이콘위에 팝업이 띄워지지 않음. 배열로 생성되지 않음. 
# 	help.onClick (event, layer) ->
# 		popup.states.switch "open"
# 		print "click"
# 	help.onMouseOut (event, layer) ->
# 		popup.states.switch "close"
# 		print "out"

# FACEBOOK - PARK sung wan님의 솔루션
# 	cell.children[1].onClick (event, layer) ->
# 		layer.parent.bringToFront()
# 		layer.parent.children[3].states.switch "open"
# 	cell.children[1].onMouseOut (event, layer) ->
# 		layer.parent.children[3].states.switch "close"

#FACEBOOK - IM daechan님의 솔루션
# 	help.onClick ->
# 		@.parent.bringToFront()		
# 		@.parent.children[3].states.switch "open"
# 	help.onMouseOut ->
# 		@.parent.children[3].states.switch "close"	

#이렇게 해도 팝업이 안 열림.. 맨 끝에 배열 쎌에서만 열림. 
# 	cell.children[1].onClick (event, layer) ->
# 		print "children"
# 		cell.children[3].states.switch "open"

#이렇게 해도 안됨...
# 	actions.push(help)
# 	[0...actions.length].map (i) ->	
# 		actions[i].on Events.Click,->
# 				cell.image = 'images/00'+(i+1)+'.png'

#help아이콘대신 팝업 아이콘 누르면 팝업이 열리긴 함..
# 	popup.onClick (event, layer) -> 
# 		layer.states.switch "open"
# 		print "ooo"	
# 	popup.onMouseOut (event, layer) ->
# 		layer.states.switch "close"
# 		print "ccc"	


