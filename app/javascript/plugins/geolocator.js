
const locateCoords = () => {
	var options = {
  enableHighAccuracy: true,
  timeout: 50000,
  maximumAge: 0
	}
	const a = document.getElementById('confirm-btn');
	const b = document.getElementById('map-button1');
	const c = document.getElementById('back-btn');
	const listButtonOnMap = document.querySelector('.btn-map');
	const allEvents = document.getElementById('all-btn');
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
			listButtonOnMap.addEventListener('click',(event)=>{
				window.location.href=`/events?latitude=${crd.latitude}&longitude=${crd.longitude}`;
			})
		} else if (c) {
			c.addEventListener('click',(event)=>{
				window.location.href=`/events?latitude=${crd.latitude}&longitude=${crd.longitude}`;
			})
		} else if (allEvents) {
			allEvents.addEventListener('click',(event)=>{
				window.location.href='/events'
			})
		}
	}
	function error(err) {
	  console.warn(`ERROR(${err.code}): ${err.message}`);
	}
	navigator.geolocation.getCurrentPosition(success, error, options);
}
export { locateCoords }
