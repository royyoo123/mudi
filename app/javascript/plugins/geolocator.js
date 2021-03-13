
const locateCoords = () => {
	var options = {
  enableHighAccuracy: true,
  timeout: 50000,
  maximumAge: 0
	}
	const a = document.getElementById('confirm-btn');
	const b = document.getElementById('map-button1');
	
	const listButtonOnMap = document.querySelector('.btn-map');
	
	const handleButtonClick = (event) => {
		window.location.href=window.location.href=`/events?latitude=${crd.latitude}&longitude=${crd.longitude}&moods=${array1}`;
	}
	if (a) a.addEventListener('click', handleButtonClick)
	function success(pos) {
	  var crd = pos.coords;
	  if(a){
	  	const buttons = document.querySelectorAll('.mood-input');
			let array = [];
			let array1 = '';
			a.removeEventListener('click', handleButtonClick)
	  	a.addEventListener('click',(event) => {
	  		// iterate over buttons
	  		// check if theyre checked/input
	  		// store checked ids in array
	  		// join array and pass into href
	  		buttons.forEach((button) => {
	  			if(button.checked===true){
	  				array.push(button.dataset.formId);
	  		}
	  		array1 = array.join(",");
	  		})
	 
				window.location.href=`/events?latitude=${crd.latitude}&longitude=${crd.longitude}&moods=${array1}`;
			})
		} else if (b) {
			b.addEventListener('click',(event) => {
				window.location.href=`/events/map?latitude=${crd.latitude}&longitude=${crd.longitude}`;
			})
		} else if (listButtonOnMap) {
			window.location.href=`/events?latitude=${crd.latitude}&longitude=${crd.longitude}&moods=${array1}`;
		} 
	}
	function error(err) {
	  console.warn(`ERROR(${err.code}): ${err.message}`);
	}
	navigator.geolocation.getCurrentPosition(success, error, options);
}
export { locateCoords }
