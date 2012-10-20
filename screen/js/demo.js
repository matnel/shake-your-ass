var _HEIGHT = $(window).height();
var _WIDTH = $(window).width();

var _COLORS = ['#0099CC', '#0099FF', '#00CCFF'];
var _count = 0;

function Bubble() {
	
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