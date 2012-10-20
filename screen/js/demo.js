var _HEIGHT = $(window).height();
var _WIDTH = $(window).width();

var _COLORS = ['#0099CC', '#0099FF', '#00CCFF'];
var _count = 0;

function Bubble() {

	// add audio element
	var x = $('<audio>', { src : './audio/alert.mp3', autoplay : true } );
	$('body').append( x );

	// add visual element
	
	this.element = $('<div>', { class : 'bubble' } );

	this.element.css( { left : Math.random() * _WIDTH , top : Math.random() * _HEIGHT, background : _COLORS[ _count % _COLORS.length ] } );

	$('body').append( this.element );

	_count++;

}
Bubble.prototype.move = function( data ) {
	var x = data.x.delta + 10;
	var y = data.y.delta + 10;

	this.element.css( { 'width' : x, 'height' : y, 'margin-top' : -y / 2 -5, 'margin-left' : -x / 2 - 5 } );
}

Bubble.prototype.remove = function() {
	this.element.fadeOut(5000);
}