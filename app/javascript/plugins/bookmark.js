const bookmark = () => {
	const hearts = document.querySelectorAll(".fa-bookmark");
	console.log();
	hearts.forEach((heart) => {
		const eventId = heart.dataset.formId;
		heart.addEventListener("touchstart click", (event) => {
			event.preventDefault();
			// console.log(event.path[0].className);
			if(event.path[0].className === "fas fa-bookmark"){
				fetch(`/bookmarks/${eventId}`, {
					method: "DELETE"
					// body: JSON.stringify({})
				})
				.then((data)=>{
					heart.classList.remove("fas")
					heart.classList.add("far")
				});
			} else {
				const data = {
					bookmark: { event_id: eventId }
				}
				fetch(`/bookmarks`, {
					method: "POST",
					headers: {"Content-Type": "application/json"},
					body: JSON.stringify(data)
				})

				.then((data) => {
					heart.classList.add("fas")
					heart.classList.remove("far")
				});
			}
			return false;
		});
	});
	
};

export { bookmark };