import controlP5.*;
ControlP5 cp5; //initiate controlp5

ColorPicker cp; //colorpicker

Textarea myTextarea; //forframerate

Println console; //console


ControlP5 cp5Knob;
int boneValue=255;
int eyesValue=100;

Knob myKnob;

float x;
float y;
float z;
float w;
int dragX, dragY;
int moveX,moveY;
int frame = 0;
float easing = 0.05;
boolean spec = false;

void setup() {
size(500,680);
noStroke();

  
cp5 = new ControlP5(this); //PICKER

  
       cp5.getTab("default").setLabel("play").setId(1);
  cp5.getTab("extra").setLabel("show").setId(2);     

  
    cp = cp5.addColorPicker("picker")
          .setPosition(140, 550)
          .setColorValue(color(200, 90, 100, 0));
  
  cp5.addFrameRate().setInterval(10).setPosition(0,height - 10); //showframerate 
  
   cp5.addToggle("spec").setPosition(344,612).setSize(50,15).setMode(Toggle.SWITCH);

  
   
    cp5Knob = new ControlP5(this);
  myKnob = cp5.addKnob("boneValue")
               .setRange(0,255)
               .setValue(50)
               .setPosition(60,550)
               .setRadius(30)
              
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(24, 75, 61))
               .setColorActive(color(255))
               .setDragDirection(Knob.HORIZONTAL);    
           

  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("eyesValue") //slider
     .setPosition(140,612)
     .setRange(0,255)
     ;
}



void draw() {
  cursor(CROSS); //cursos icon

//event flow
  if (frame > 200) { // If 200 frames since the mouse
    noLoop(); // was pressed, stop the program
    background(0); // and turn the background black.
  } else { // Otherwise, set the background
    background(cp.getColorValue()); 
    line(mouseX, 0, mouseX, 100); // at the mouse position
    line(0, mouseY, 100, mouseY);
    frame++;
  }



//coded key
if (key == CODED) { 
  //click "UP" to move the rectangle up.
    if (keyCode == UP) {
      y = 0;
//click "DOWN" to move the rectangle down. (background)
    } else if (keyCode == DOWN) {
      y = 250;
    }
  } else {
    y = 0;
  }
  fill(255,70); //white color rectangle (half transparent)
  rect(0, y, 500, 250);
  


  if (mouseX < 250) { //when the mouseX more than 250
    fill(201,241,255,100);
    rect(0, 0, 250, 500); // Left Rectange (background)
  } else {
    fill(201,241,255,100);
    rect(250, 0, 250, 500); // Right rectange (background)
  }



//mouse data
float z = mouseX;
float y = mouseY;
  float ix = width - mouseX; // Inverse X
  float iy = height - mouseY; // Inverse Y
//if mouseX is bigger than 250 and less than 500, mouse Y is bigger than 0 and less than 500, the circle will change its size.
  if ((mouseX > 250) && (mouseX < 500) && (mouseY > 0) && (mouseY < 500)) {
  fill(0, 50);
    }else{
      fill(0,80);
    }
      ellipse(x, height/2, y, y);
  fill(255,50);
  ellipse(ix, height/2, iy, iy);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing; //increase the size of circle
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing; //increase the size of circle
  

  

 //shape of dog
fill(103,61,6);
triangle(338,440,394,380,295,420);
 fill(175,109,2);
 quad(200,300,320,300,350,450,150,450);
 fill(103,61,6);
 ellipse(170,90,70,70);
 ellipse(330,90,70,70);
 ellipse(210,440,64,44);
 ellipse(295,440,64,44);
 fill(175,109,2);
 ellipse(250,200,260,260);

 //dog's mouth

fill(255,70,116);
ellipse(235,295,30,30);
line(236,295,185,305);

//dog's nose

fill(255,244,214);
ellipse(250,270,100,55);


line(250,250,200,295);


fill(70,51,5);
ellipse(250,250,30,20);


if(spec){
fill(59,27,7);
ellipse(199,191,78,96);//left.O
ellipse(299,191,78,96);//right.O
}
  
//eyes
fill(255);
ellipse(200,190,60,80);
ellipse(300,190,60,80);
fill(eyesValue,60,20);//eyes's color
//eye ball move with mouse
ellipse(203+(map(mouseX,0,400,-10,10)),205+(map(mouseY,0,600,0,0)),23,35);
ellipse(303+(map(mouseX,0,400,-10,10)),205+(map(mouseY,0,600,0,0)),23,35);
 
     fill(255); 
 ellipse(dragX+50,dragY+50,30,30);
ellipse(dragX+50,(dragY-30)+50,30,30);
rect(dragX+50,(dragY-30)+50,70,35);
ellipse((dragX+70)+50,dragY+50,30,30);
ellipse((dragX+70)+50,(dragY-30)+50,30,30); //bone



//mouse buttons
if (mousePressed == true) {//if mouse is pressed, the bone will change colors. 
    if (mouseButton == LEFT) {
      fill(200); 
    } else if (mouseButton == RIGHT) { 
      fill(170);
    }
  } else {
    fill(boneValue); //change bone's color
  }
  
  //keyboard data
  if (keyPressed == true) { // If the key is pressed,
ellipse(mouseX, mouseY, 50, 50); //draw a ball.
   
  } else { // Otherwise,
//bone
 ellipse(mouseX,mouseY,30,30);
ellipse(mouseX,mouseY-30,30,30);
rect(mouseX,mouseY-30,70,35);
ellipse(mouseX+70,mouseY,30,30);
ellipse(mouseX+70,mouseY-30,30,30);

  }

}

void mouseMoved() { // Move the bone
  moveX = mouseX;
  moveY = mouseY;
}

void mouseDragged() { // When you drag the mouse, you will move the big pink rectangle
  dragX = mouseX;
  dragY = mouseY;
}

void mousePressed() {
  loop(); //press mouse to loop.
  frame = 0;
}

