
ass = {}

# Application initialize
ass.init = () ->
  #$("a").click (event) ->
  #  event.preventDefault();
  #  alert "Thanks for visiting!"

  canvas = $("#shakecanvas")[0]
  context = canvas.getContext('2d')

  angle = Math.floor(Math.random()*360) * 1.0
  center = 32.0
  radius = 30.0

  l = ass.getCircleCoordinates center, center, radius, angle

  context.beginPath()
  context.moveTo center, center
  context.lineTo l.x, l.y
  context.strokeStyle = '#ff0000'
  context.stroke()

  context.beginPath()
  context.arc(center, center, radius, 0, 2 * Math.PI, false);
  context.stroke()

  angleStr = 'rotate('+angle+'deg)'
  $('.item').css({
    '-transform': angleStr,
    '-ms-transform': angleStr,
    '-moz-transform': angleStr,
    '-webkit-transform': angleStr,
    '-o-transform': angleStr
  }).html(angle)

  ass.counter = 0


# Calculate circle coordinates
ass.getCircleCoordinates = (x, y, radius, angle) ->
  result = {}
  result.x = x + radius * Math.cos(angle*Math.PI/180.0)
  result.y = y - radius * Math.sin(angle*Math.PI/180.0)
  return result


#ass.animate = () ->

ass.animate = () ->
  $('#header').append ass.counter
  console.log 'counter = '+ass.counter
  ass.counter++
  window.setInterval ass.animate, 10


$(document).ready ->
  console.log 'ready!'
  ass.init()
  ass.animate()


