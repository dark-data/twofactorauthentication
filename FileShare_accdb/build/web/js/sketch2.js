var r1=50;
var r2=50;
var r3=50;
var r4=50;
function setup() {
  var cnv = createCanvas(windowWidth, 20);
  cnv.style('display', 'block');
  var i=0;
  for(i=0;i<10000;i++){
    fill(random(200,255),random(155),random(200,255));
    ellipse(random(i+100),random(20),25);
  }
}

function draw() {
  
  //if(mouseX>width/20 && mouseX< (width/6)+(width/6))
  //  r1 = 100;
  //else
  //  r1=50;
  fill(mouseX,random(168),mouseY);
  ellipse(mouseX,random(20),100);
  //ellipse(width/8,2,r1);
  //ellipse((width/6)+(width/5),2,r2);
  //ellipse((width/2)+(width/9),2,r3);
  //ellipse((width/2.2)+(width/2.5),2,r4);
}