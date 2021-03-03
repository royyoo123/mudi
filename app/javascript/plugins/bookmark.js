const bookmark = () => {
	const hearts = document.querySelectorAll(".bookmark-heart");
	hearts.forEach((heart) => {
		heart.addEventListener("click", (event) => {
			heart.classList.toggle("far")
			heart.classList.toggle("fas")
			heart.classList.toggle("red")
			const eventId = heart.dataset.formId
			const formContainer = document.querySelector(`#form_${eventId}`)
			if (formContainer) {
			formContainer.querySelector('form').submit()
			}
		});
	});
};

export { bookmark };