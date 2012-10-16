
ass = {}

# Check WebGL support
unless Detector.webgl
  Detector.addGetWebGLMessage()


# Three.js initialize
ass.initThreeJS = ->
  # Mouse
  ass.mouseX = 0
  ass.mouseY = 0
  ass.windowHalfX = window.innerWidth / 2
  ass.windowHalfY = window.innerHeight / 2

  # Three.js canvas container
  ass.container = document.createElement 'div'
  document.body.appendChild ass.container

  # Scene
  ass.scene = new THREE.Scene()
  ass.scene.fog = new THREE.FogExp2 0x000000, 0.0008

  # Camera
  ass.camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 4000
  ass.camera.position.z = 2000
  ass.scene.add ass.camera

  # Generate geometry
  ass.geometry = new THREE.Geometry()
  fieldSize = 3000
  for i in [0..1000]
    vertex = new THREE.Vector3()
    vertex.x = Math.random() * fieldSize - fieldSize*0.5
    vertex.y = Math.random() * fieldSize - fieldSize*0.5
    vertex.z = Math.random() * fieldSize - fieldSize*0.5
    ass.geometry.vertices.push vertex

  # Load textures
  sprite1 = THREE.ImageUtils.loadTexture 'img/particle.png'

  # Setup parameters for particle systems
  ass.parameters = [
    [[1.0, 0.2, 1.0], sprite1, 20],
    [[0.95, 0.1, 1], sprite1, 15],
    [[0.90, 0.05, 1], sprite1, 10],
    [[0.85, 0, 0.8], sprite1, 8],
    [[0.80, 0, 0.7], sprite1, 5]]

  # Create particle systems & materials
  ass.materials = []
  for i in [0..ass.parameters.length-1]
    color = ass.parameters[i][0]
    sprite = ass.parameters[i][1]
    size = ass.parameters[i][2]
    ass.materials[i] = new THREE.ParticleBasicMaterial(
      size: size
      map: sprite
      blending: THREE.AdditiveBlending
      depthTest: false
      transparent: true
    )
    ass.materials[i].color.setHSV color[0], color[1], color[2]

    particles = new THREE.ParticleSystem(ass.geometry, ass.materials[i])
    particles.rotation.x = Math.random() * 6
    particles.rotation.y = Math.random() * 6
    particles.rotation.z = Math.random() * 6
    ass.scene.add particles

  # Renderer
  ass.renderer = new THREE.WebGLRenderer clearAlpha: 1
  ass.renderer.setSize window.innerWidth, window.innerHeight
  ass.container.appendChild ass.renderer.domElement

  # Stats
  ass.stats = new Stats()
  ass.stats.domElement.style.position = "absolute"
  ass.stats.domElement.style.top = "0px"
  ass.container.appendChild ass.stats.domElement

  # Event listeners
  document.addEventListener "mousemove", ass.onDocumentMouseMove, false
  document.addEventListener "touchstart", ass.onDocumentTouchStart, false
  document.addEventListener "touchmove", ass.onDocumentTouchMove, false
  window.addEventListener "resize", ass.onWindowResize, false

  # Timing
  ass.elapsedTime = 0.0
  ass.time = Date.now() * 0.00005
  ass.lastTime = ass.time


# Event listener: window resize
ass.onWindowResize = ->
  ass.windowHalfX = window.innerWidth / 2
  ass.windowHalfY = window.innerHeight / 2
  ass.camera.aspect = window.innerWidth / window.innerHeight
  ass.camera.updateProjectionMatrix()
  ass.renderer.setSize window.innerWidth, window.innerHeight


# Event listener: mouse move
ass.onDocumentMouseMove = (event) ->
  ass.mouseX = event.clientX - ass.windowHalfX
  ass.mouseY = event.clientY - ass.windowHalfY


# Event listener: document touch start
ass.onDocumentTouchStart = (event) ->
  if event.touches.length is 1
    event.preventDefault()
    ass.mouseX = event.touches[0].pageX - ass.windowHalfX
    ass.mouseY = event.touches[0].pageY - ass.windowHalfY


# Event listener: document touch move
ass.onDocumentTouchMove = (event) ->
  if event.touches.length is 1
    event.preventDefault()
    ass.mouseX = event.touches[0].pageX - ass.windowHalfX
    ass.mouseY = event.touches[0].pageY - ass.windowHalfY


# Three.js animate
ass.animate = ->
  requestAnimationFrame ass.animate
  ass.render()
  ass.stats.update()


# Three.js render
ass.render = ->
  # Timing
  ass.lastTime = ass.time
  ass.time = Date.now() * 0.00005
  ass.deltaTime = ass.time - ass.lastTime
  ass.elapsedTime += ass.deltaTime

  camera = ass.camera
  scene = ass.scene

  # Animate camera
  camera.position.x += (ass.mouseX - camera.position.x) * 0.05
  camera.position.y += (-ass.mouseY - camera.position.y) * 0.05
  camera.lookAt scene.position

  # Animate particle movement
  for i in [0..scene.children.length-1]
    object = scene.children[i]
    if object instanceof THREE.ParticleSystem
      # bouncy movement
      s = 1.0 + Math.abs(Math.sin(ass.elapsedTime * 50))*0.5
      object.scale.set 1, 1, s
      object.rotation.y = ass.time * ((if i < 4 then i + 1 else -(i + 1)))

  # Animate particle colors
  for i in [0..ass.materials.length-1]
    color = ass.parameters[i][0]
    h = (360 * (color[0] + ass.time) % 360) / 360
    ass.materials[i].color.setHSV h, color[1], color[2]

  ass.renderer.render scene, camera


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


# Calculate circle coordinates
ass.getCircleCoordinates = (x, y, radius, angle) ->
  result = {}
  result.x = x + radius * Math.cos(angle*Math.PI/180.0)
  result.y = y - radius * Math.sin(angle*Math.PI/180.0)
  return result


$(document).ready ->
  if !Detector.webgl
    Detector.addGetWebGLMessage()

  ass.init()
  ass.initThreeJS()
  ass.animate()


