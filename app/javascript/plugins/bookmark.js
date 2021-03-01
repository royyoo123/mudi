let bookmark = () => {
	let hearts = document.querySelectorAll(".bookmark");
	hearts.forEach((heart) => {
		heart.addEventListener("click", (event) => {
			console.log("test")
		});
	});
	
};

export { bookmark };