function OpenMenu(key) {
    var x = document.getElementById(key);
    if(x.classList.contains('show-menu')){
      x.classList.remove('show-menu');
    }else{
      x.classList.add("show-menu");
    }

    // if (x.style.display == "block") {
    //   x.style.display = "none";
    // } else {
    //   x.style.display = "block";
    // }
  }