const syncCalendar = () => {
	const button = document.querySelector("#book-btn");
  const description = document.querySelector("#event-description");
  const name = document.querySelector("#name");
  
  const address = document.querySelector("#event-address");
  const dateTime = document.querySelector("#date-time")
  let baseUrl = "https://www.google.com/calendar/render?action=TEMPLATE&text=";
  if(button){
  button.addEventListener("click", () => {
    baseUrl += name.innerText.split(' ').join('+');
    alert("wait");
    baseUrl += "&details=";
    baseUrl += description.innerText.split(' ').join('+');
    baseUrl += "&location=";
    baseUrl += address.innerText.split(' ').join('+');
    baseUrl += "&dates=";
    console.log(dateTime);
    let dateTimeNew = dateTime.innerText.split('');
    let dateConverter = (x) => {
      let string = '';
      x.forEach((letter) => {
        if(string.length === 8){
          string += 'T'
        } else {
          if(letter === "/" || letter ==="," || letter ===":" || letter === ' ' || letter === 'P' || letter === 'M'){
            string += ''
          } else {
            string += letter
          };
        };
      });
      return string;
    }
    let startTime = dateConverter(dateTimeNew);
    let newStartTime = startTime.slice(0, -4) + (parseInt(startTime.slice(startTime.length -4)) + 400).toString();
    baseUrl += newStartTime;
    baseUrl += "00Z%2F";
    let endTime = newStartTime.slice(0, -4) + (parseInt(newStartTime.slice(newStartTime.length -4)) + 200).toString();
    console.log(endTime);
    baseUrl += endTime;
    baseUrl += "00Z";
    const tab = window.open(baseUrl, '_blank');
  });
};
};
  export { syncCalendar };
  // "%Y/%m/%d %l:%M %p"
  // //
  //20210309T170000Z%2F20210309T180000Z
  //2021/03/18,12:00,PM


  // var str2 = str1.slice(0, -1) + '.';

  // https://www.google.com/calendar/render?action=TEMPLATE&text=How+to+rock+a+fedora&details
  // =learn+blah+blah+blah+blah+blah&location=1234+Orange+Ave+San+Antonio+TX&dates=20210309T170000Z