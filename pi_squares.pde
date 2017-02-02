int digits = 1000000;           //always update this if you change or edit the txt file
int lines = (digits / 50) + 1;  //1 million digits, 50 in each line + the 3
int x = 0;
int y = 0;
int lato = 1;
int size = ceil(sqrt(digits)*lato);

void setup() {
  println("best window size using "+ lato + "*" + lato + " squares and " + digits + " digits: " + size + " * " + size);
  size(1300, 770);      //width and height
  //fullScreen();
  surface.setResizable(true);
  
  String PiInput[] = loadStrings("pi 1M.txt");
  
  for (int i = 0; i < lines; i++) {
      //println(PiInput[i]);
      char[] charsArray = new char[PiInput[i].length()];

      for (int j = 0; j < PiInput[i].length(); j++) {
        charsArray[j] = PiInput[i].charAt(j);
        int current = int(charsArray[j]);
        current -= 48;
        //println(charsArray[j])
        
        color col = int(map(current, 0, 9, 255, 0));
        fill(col);
        //println(lato);
        noStroke();
        
        rect(x, y, lato, lato);
        x+= lato;
        if (x >= width) {
          y+= lato;
          x = 0;
        }
      }
    }
}