/**
* Copyright (C) 2012 Manteli Technologies
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

function Accelerometer() {

	// triggered threshold
	this._DELTA = 10;

	this._init();
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

Accelerometer.prototype.stop = function() {
	// TODO: FIXME
	alert('Accelerometer.stop not yet implemented')
}

Accelerometer.prototype.up = $.noop;
Accelerometer.prototype.down = $.noop;
Accelerometer.prototype.left = $.noop;
Accelerometer.prototype.right = $.noop;
