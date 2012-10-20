var init = function() {

	var bubbles = {};

	// one user moved
	now.move = function( data ) {
		var b = bubbles[ data.user.clientId ];
		b.move( data );
	}


	// user has been removed from the system
	now.removeUser = function( user ) {
		console.log('Remove');
		// delete item
		bubbles[ user.clientId ].remove();
	}

	now.addUser = function( user ) {
		console.log('Daa');
		bubbles[ user.clientId  ] = new Bubble();
	}
}

// inject now.js
var s = document.createElement('script');
s.async = true;
s.type = 'text/javascript';
s.src = 'http://humanisti.fixme.fi:8888/nowjs/now.js';
s.onload = s.onreadystatechange = function() {
    init();
};
var head = document.getElementsByTagName('head')[0];
head.appendChild(s);

// add the connect button
var b = $('<button>', { html : 'Connect to server', css : { position: 'absolute', top: '10px', left: '10px', 'z-index': 666 } } );
b.click( function() { now.screen(); b.remove(); } );
b.appendTo('body')

