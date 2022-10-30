function send_credit (){
  const submit = document.getElementById('button');
  submit.addEventListener("click",(e) => {
    e.preventDefault();
    console.log('発火')
  });

};

window.addEventListener('load', send_credit);