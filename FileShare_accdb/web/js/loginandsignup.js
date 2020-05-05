/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}
  
function acc(ele,n1,n2,n3,n4) {
    var srcElement = document.getElementById(ele);
    var srcElement1 = document.getElementById(n1);
    var srcElement2 = document.getElementById(n2);
    var srcElement3 = document.getElementById(n3);
    var srcElement4 = document.getElementById(n4);

    if (srcElement != null) {
        if (srcElement.style.display == "block") {
            srcElement.style.display = 'none';
            srcElement1.style.display = 'none';
            srcElement2.style.display = 'none';
            srcElement3.style.display = 'none';
            srcElement4.style.display = 'none';

        }
        else {
            srcElement.style.display = 'block';
            srcElement1.style.display = 'none';
            srcElement2.style.display = 'none';
            srcElement3.style.display = 'none';     
            srcElement4.style.display = 'none';
            sleep(500);
            
            srcElement.scrollIntoView();
            
        }
        return false;
        
        }
    }
function cloud(ele,n1,n2) {
    var srcElement = document.getElementById(ele);
    var srcElement1 = document.getElementById(n1);
    var srcElement2 = document.getElementById(n2);
    
    if (srcElement != null) {
        if (srcElement.style.display == "block") {
            srcElement.style.display = 'none';
            srcElement1.style.display = 'none';
            srcElement2.style.display = 'none';
        }
        else {
            srcElement.style.display = 'block';
            srcElement1.style.display = 'none';
            srcElement2.style.display = 'none';          
        }
        return false;
        
        }
    }

function authorityoption(ele, ele2, ele3) {
    var srcElement = document.getElementById(ele);
    var srcElement2 = document.getElementById(ele2);
    var srcElement3 = document.getElementById(ele3);

    if (srcElement != null) {
        if (srcElement.style.display == "block") {
            srcElement.style.display = 'none';
        }
        else{
            srcElement.style.display = 'block';
            srcElement2.style.display = 'none';
            srcElement3.style.display = 'none';
            

        }
        return false;
    }
}

function trusteeoption(ele, ele2) {
    var srcElement = document.getElementById(ele);
    var srcElement2 = document.getElementById(ele2);

    if (srcElement != null) {
        if (srcElement.style.display == "block") {
            srcElement.style.display = 'none';
        }
        else{
            srcElement.style.display = 'block';
            srcElement2.style.display = 'none';

        }
        return false;
    }
}



function useroption(ele, ele2, ele3) {
    var srcElement = document.getElementById(ele);
    var srcElement2 = document.getElementById(ele2);
    var srcElement3 = document.getElementById(ele3);
    var srcElement4 = document.getElementById("home");

    if (srcElement != null) {
        if (srcElement.style.display == "block") {
            srcElement.style.display = 'none';
        }
        else{
            srcElement.style.display = 'block';
            srcElement2.style.display = 'none';
            srcElement3.style.display = 'none';
            srcElement4.style.display = 'none';
        }
        return false;
    }
}