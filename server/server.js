var httpServer = require('http').createServer(function(req, response){})
httpServer.listen( 8888 );

var nowjs = require("now");
var everyone = nowjs.initialize(httpServer);

var screen = nowjs.getGroup("screen");

// login new screen
everyone.now.screen = function() {
	screen.addUser( this.user.clientId );
}

everyone.now.motion = function( data ) {
	data.user = this.user;
	screen.now.move( data )
}

// events
nowjs.on('connect', function () {
    screen.now.addUser( this.user );
} );

nowjs.on('disconnect', function () {
    screen.now.removeUser( this.user );
} );