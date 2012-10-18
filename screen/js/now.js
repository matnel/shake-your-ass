var init = function() {

	// one user moved
	now.move = function( data ) {
		console.log('OK');
	}


	// user has been removed from the system
	now.removeUser = function( user ) {
		console.log( 'gone' );
	}

	now.addUser = function( user ) {
		console.log('haz');
	}

	// now.screen(); // this must be called, but at later stage

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