var _HEIGHT = $(window).height();
var _WIDTH = $(window).width();

function Bubble() {
	
	this.element = $('<div>', { class : 'bubble', html : 'Daa' } );

	this.element.css( { left : Math.random() * _WIDTH , top : Math.random() * _HEIGHT } );

	$('body').append( this.element );

}
Bubble.prototype.move = function( data ) {
	var x = data.x.delta + 10;
	var y = data.y.delta + 10;

	this.element.css( { 'width' : x, 'height' : y, 'margin-top' : -y / 2 -5, 'margin-left' : -x / 2 - 5 } );
}