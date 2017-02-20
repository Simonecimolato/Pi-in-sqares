String[] PiInput;
int x = 0;
int y = 0;
int lato = 1;
int digits;

void setup() {
  size(1300, 770);      //width and height
  //fullScreen();
  surface.setResizable(true);
  PiInput = loadStrings("data/pi 1M.txt");         //you can do this with any txt that is containig numbers.
}

//screenshot
void draw() {
  for (int i = 0; i < PiInput.length; i++) {
      //println(PiInput[i]);
      char[] charsArray = new char[PiInput[i].length()];

      for (int j = 0; j < PiInput[i].length(); j++) {
        charsArray[j] = PiInput[i].charAt(j);
        
        //from char to int
        int current = int(charsArray[j]);        
        current -= 48;
        //println(charsArray[j])
        digits++;
        
        //mapping the color to use and coloring
        color col = int(map(current, 0, 9, 0, 255));
        fill(col);
        //println(lato);
        
        //drawing
        noStroke();
        rect(x, y, lato, lato);
        x+= lato;
        if (x >= width) {
          y+= lato;
          x = 0;
        }
      }
    }
    int size = ceil(sqrt(digits)*lato);
    println("best window size using "+ lato + "*" + lato + " squares and " + digits + " digits: " + size + " * " + size);

 if (mousePressed) {
    save("resault.png");
    println("screenshot saved!");
 }
 noLoop();
}
