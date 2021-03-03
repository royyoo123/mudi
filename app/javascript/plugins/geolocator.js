const locateCoords = () => {
	var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
	}
	const a = document.querySelector('#confirm-btn');
	const b = document.querySelector('#map-button1');
	const c = document.querySelector('.btn-map')
	function success(pos) {
	  var crd = pos.coords;
	  if(a){
	  a.addEventListener('click',(event) => {
			window.location.href=`http://localhost:3000/events?latitude=${crd.latitude}&longitude=${crd.longitude}`;
		})
	} else if (b) {
		b.addEventListener('click',(event) => {
			window.location.href=`http://localhost:3000/events/map?latitude=${crd.latitude}&longitude=${crd.longitude}`;
		})
	} else if (c) {
		c.addEventListener('click',(event)=> {
			window.location.href=`http://localhost:3000/events?latitude=${crd.latitude}&longitude=${crd.longitude}`;
		})
	}
	}
  
	function error(err) {
	  console.warn(`ERROR(${err.code}): ${err.message}`);
	}

	navigator.geolocation.getCurrentPosition(success, error, options);

}

export { locateCoords }
