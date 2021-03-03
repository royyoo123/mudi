import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
// if ("geolocation" in navigator) { 
//     navigator.geolocation.getCurrentPosition(position => { 
//         var map = new mapboxgl.Map({
//         // container id specified in the HTML
//           container: 'map',

//            // style URL
//           style: 'mapbox://styles/mapbox/light-v10',

//          // initial position in [lon, lat] format
//           center: [position.coords.longitude, position.coords.latitude],

//          // initial zoom

//          zoom: 14
//         });
//     }); 
// } 
  var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/royyoo123/cklsk6dkc1jiu17mgpi2co94m',
    
    zoom: 10
  });
    map.addControl(
  new mapboxgl.GeolocateControl({
  positionOptions: {
  enableHighAccuracy: true
  },
  trackUserLocation: true
  })
  );
    return map
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  // Create a HTML element for your custom marker
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';

  // Pass the element as an argument to the new marker
  new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);
});
};

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    // fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
  }
};

export { initMapbox };