
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
					heart.classList.toggle("fas")
					heart.classList.toggle("far")
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
					heart.classList.toggle("fas")
					heart.classList.toggle("far")
				});
			}
			// console.log('hello');
			// heart.classList.toggle("far");
			// heart.classList.toggle("fas");
			// heart.classList.toggle("red");
			// const eventId = heart.dataset.formId;
			// const formContainer = document.querySelector(`#form_${eventId}`);
			// if (formContainer) {
			// 	// formContainer.querySelector('form').submit();
			// }

		});
	});

};

export { bookmark };