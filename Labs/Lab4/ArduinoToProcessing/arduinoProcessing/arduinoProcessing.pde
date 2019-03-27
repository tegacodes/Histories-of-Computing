//SET UP
//Run this code and stop it.
//See the console for a print out of your computer's ports
//Counting up from 0, count what number port is "/dev/tty.usbmodem14201"
//or "“/dev/tty.usbmodem1421”"
//Enter that into line 25.
//After this, the data should print to the console.


import processing.serial.*; //Import Serial library

Serial myPort;

// at the top of the program:
float xPos = 0;    // horizontal position of the graph
float yPos = 0;    // vertical position of graph
int inByte;        // variable for incoming data 

void setup () {
  size(800, 600);        // window size

  // List all the available serial ports
  println(Serial.list());

  // change the number below to match your port:
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
  background(#081640);
}

void draw () {
  // nothing happens in draw.  It all happens in SerialEvent()
  yPos = height - inByte;
  // draw the line in a pretty color:
  stroke(255);
  line(xPos, height, xPos, yPos);
  // at the edge of the screen, go back to the beginning:
  if (xPos >= width) {
    xPos = 0;
    // clear the screen by resetting the background:
    background(#081640);
  } else {
    // increment the horizontal position for the next reading:
    xPos++;
  }
}

void serialEvent (Serial myPort) {
  println("SerialEvent");
  // get the byte:
  inByte = myPort.read();
  // print it:
  println(inByte);
  
}
