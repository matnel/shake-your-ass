function Accelerometer() {

};

Accelerometer.prototype._init = function() {
	window.addEventListener('deviceorientation', this._handle, false);
};

Accelerometer.prototype._handle = function() {

}
