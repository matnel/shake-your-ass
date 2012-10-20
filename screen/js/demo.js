var bubbles = {};

function Bubble() {
	
	this._d = $('<div>', { class : 'bubble', style: 'background: white;', html : 'Daa' } );
	$('body').append( this._d );

}
Bubble.prototype.move = function( data ) {
	var x = data.x.delta + 10;
	var y = data.y.delta + 10;
	this._d.css( { width : x, height: y } );
}