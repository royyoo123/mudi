const bookmark = () => {
	const hearts = document.querySelectorAll(".bookmark");
	hearts.forEach((heart) => {
		heart.addEventListener("click", (event) => {
			console.log("test")
		});
	});
	
};

export { bookmark };