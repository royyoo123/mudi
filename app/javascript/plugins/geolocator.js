
const locateCoords = () => {
	var options = {
  enableHighAccuracy: true,
  timeout: 50000,
  maximumAge: 0
	}
	const a = document.getElementById('confirm-btn');
	const b = document.getElementById('map-button1');
	const c = document.querySelector('.btn-map');
	const d = document.getElementById('back-btn');

	const handleButtonClick = (event) => {
		window.location.href=`http://www.localhost:3000/events`;
	}
	if (a) a.addEventListener('click', handleButtonClick)
	function success(pos) {
	  var crd = pos.coords;
	  if(a){
			a.removeEventListener('click', handleButtonClick)
	  	a.addEventListener('click',(event) => {
				window.location.href=`http://www.localhost:3000/events?latitude=${crd.latitude}&longitude=${crd.longitude}`;
			})
		} else if (b) {
			b.addEventListener('click',(event) => {
				window.location.href=`http://www.localhost:3000/events/map?latitude=${crd.latitude}&longitude=${crd.longitude}`;
			})
		} else if (c) {
			c.addEventListener('click',(event) => {
				window.location.href=`http://www.localhost:3000/events?latitude=${crd.latitude}&longitude=${crd.longitude}`;
			})
		} else if (d) {
			d.addEventListener('click',(event) => {
				window.location.href=`http://www.localhost:3000/events?latitude=${crd.latitude}&longitude=${crd.longitude}`;
			})
		} 
	}
	function error(err) {
	  console.warn(`ERROR(${err.code}): ${err.message}`);
	}
	navigator.geolocation.getCurrentPosition(success, error, options);
}	
export { locateCoords }

