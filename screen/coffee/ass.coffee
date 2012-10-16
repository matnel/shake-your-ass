
ass = {}

$(document).ready ->
  $("a").click (event) ->
    event.preventDefault();
    alert "Thanks for visiting!"

  console.log $("#shakecanvas")
  console.log $("#shakecanvas")[0]
  canvas = $("#shakecanvas")[0]
  #canvas = $('canvas')[0]
  context = canvas.getContext('2d')

  angle = Math.floor(Math.random()*360) * 1.0
  radius = 32.0

  l = ass.getCircleCoordinates radius, angle

  context.beginPath()
  context.moveTo radius, radius
  context.lineTo radius+l.x, radius+l.y
  context.stroke()

  angleStr = 'rotate('+angle+'deg)'
  $('.item').css({
    '-transform': angleStr,
    '-ms-transform': angleStr,
    '-moz-transform': angleStr,
    '-webkit-transform': angleStr,
    '-o-transform': angleStr
  }).html(angle)

  #http://bl.ocks.org/1136236


ass.getCircleCoordinates = (radius, angle) ->
  result = {}
  result.x = radius * Math.cos(angle*Math.PI/180.0)
  result.y = -radius * Math.sin(angle*Math.PI/180.0)
  return result

###
  transform: rotate(7deg);
  -ms-transform: rotate(7deg); # IE 9
  -moz-transform: rotate(7deg); # Firefox
  -webkit-transform: rotate(7deg); # Safari and Chrome
  -o-transform: rotate(7deg); # Opera
###
