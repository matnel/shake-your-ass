function Accelerometer() {

	// init the track
	this._init();

	this._DELTA = 10;


};

Accelerometer.prototype._init = function() {
	var meter = this;
	window.addEventListener('deviceorientation', function(data){ meter._handle( data ) }, false);
};


Accelerometer.prototype._handle = function( event ) {

	if( event.gamma < - this._DELTA ) {
		this.left();
	}

	if( event.gamma > this._DELTA ) {
		this.right();
	}

	if( event.beta > this._DELTA ) {
		this.up();
	}

	if( event.beta < - this._DELTA  ) {
		this.down();
	}

}

Accelerometer.prototype.up = $.noop;
Accelerometer.prototype.down = $.noop;
Accelerometer.prototype.left = $.noop;
Accelerometer.prototype.right = $.noop;
