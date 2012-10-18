var init = function() {
	console.log('Ok');
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