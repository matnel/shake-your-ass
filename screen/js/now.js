var init = function() {

	var bubbles = {};

	// one user moved
	now.move = function( data ) {
		var b = bubbles[ data.user.clientId ];
		b.move( data );
	}


	// user has been removed from the system
	now.removeUser = function( user ) {
		// delete item
		bubbles[ data.user.clientId ];
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
s.src = 'http://localhost:8888/nowjs/now.js';
s.onload = s.onreadystatechange = function() {
    init();
};
var head = document.getElementsByTagName('head')[0];
head.appendChild(s);

// add the connect button
var b = $('<button>', { html : 'Connect to server', css : { position: 'absolute', top: '10px', left: '10px'  } } );
b.click( function() { now.screen(); b.remove(); } );
b.appendTo('body')