const syncCalendar = () => {
	const button = document.querySelector("#book-btn");
  const description = document.querySelector("#event-description");
  const name = document.querySelector("#name");
  const address = document.querySelector("#event-address");
  let baseUrl = "https://www.google.com/calendar/render?action=TEMPLATE&text=";
  if(button) {
  button.addEventListener("click", () => {
    baseUrl += name.innerText.split(' ').join('+')
    baseUrl += "&details="
    baseUrl += description.innerText.split(' ').join('+')
    baseUrl += "&location="
    baseUrl += address.innerText.split(' ').join('+')
    // baseUrl += "&dates="
    // baseUrl += dateTime. innerText.split(' ').join
    console.log(baseUrl);
    
    alert("wait");
    const tab = window.open(baseUrl, '_blank');
  })
}
}
  export { syncCalendar };
    






  // https://www.google.com/calendar/render?action=TEMPLATE&text=How+to+rock+a+fedora&details
  // =learn+blah+blah+blah+blah+blah&location=1234+Orange+Ave+San+Antonio+TX&dates=20210309T170000Z