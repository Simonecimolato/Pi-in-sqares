int digits = 1000000;
int x = 0;
int y = 0;
int lato = 1;
int size = ceil(sqrt(digits)*lato);

void setup() {
  println("best window size using "+ lato + "*" + lato + " squares and " + digits + " digits: " + size + " * " + size);
  size(1300, 770);      //width and height
  //fullScreen();
  surface.setResizable(true);
  String[] PiInput = loadStrings("e 1M.txt");         //you can apply this to any txt that is containig numbers.
  
  for (int i = 0; i < PiInput.length; i++) {
      //println(PiInput[i]);
      char[] charsArray = new char[PiInput[i].length()];

      for (int j = 0; j < PiInput[i].length(); j++) {
        charsArray[j] = PiInput[i].charAt(j);
        
        //from char to int
        int current = int(charsArray[j]);        
        current -= 48;
        //println(charsArray[j])
        
        //mapping the color to use and coloring
        color col = int(map(current, 0, 9, 255, 0));
        fill(col);
        //println(lato);
        noStroke();
        
        //drawing
        rect(x, y, lato, lato);
        x+= lato;
        if (x >= width) {
          y+= lato;
          x = 0;
        }
      }
    }
}

//screenshot
void draw() {
 if (mousePressed) {
    save("resault.png");
    println("screenshot saved!");
 }
}
