Coffee coffee1;

void setup() {
  size(800, 800);

  // Create one coffee object to draw.
  coffee1 = new Coffee(
  "05/10/2026",
  "Morning",
  "Espresso",
  "Bubbles and Coffee",
  "With Someone"
);
}

void draw() {
  background(248, 243, 232);
  coffee1.display(400, 400);
}

void drawCup(float x, float y, int steamLines, color cupColour, String company) {
  int handleDirection;

  if (company.equals("Alone")) {
    handleDirection = -1;  // Handle on the left
  } else {
    handleDirection = 1;   // Handle on the right
  }

  // Draw the handle first, so it sits behind the cup.
  noFill();
  stroke(80, 50, 35);
  strokeWeight(3);
  ellipse(x + handleDirection * 35, y, 24, 27);

  // Draw the cup body.
  fill(cupColour);
  rect(x - 30, y - 20, 60, 50, 8);

  // Draw the coffee surface.
  fill(90, 52, 32);
  ellipse(x, y - 18, 60, 12);

  // Draw the steam lines.
  stroke(130, 95, 70);
  strokeWeight(2);

  for (int i = 0; i < steamLines; i++) {
    float steamX = x - 12 + i * 12;
    line(steamX, y - 30, steamX - 3, y - 42);
  }
}

int steamCount(String timeOfDay) {
  if (timeOfDay.equals("Morning")) {
    return 1;
  } else if (timeOfDay.equals("Afternoon")) {
    return 2;
  } else if (timeOfDay.equals("Evening")) {
    return 3;
  } else {
    return 4;
  }
}

color coffeeColour(String type) {
  if (type.equals("Espresso")) {
    return color(116, 73, 48);
  } else if (type.equals("Macchiato")) {
    return color(190, 130, 75);
  } else if (type.equals("Cappuccino")) {
    return color(220, 183, 125);
  } else if (type.equals("Cortado")) {
    return color(158, 91, 62);
  } else {
    return color(180, 150, 112);
  }
}

class Coffee {
  String timeOfDay;
  String coffeeType;
  String company;
  String date;
  String place;

  Coffee(String date, String timeOfDay, String coffeeType, String place, String company) {
    this.timeOfDay = timeOfDay;
    this.coffeeType = coffeeType;
    this.company = company;
    this.date = date;
    this.place = place;
  }

  void display(float x, float y) {
    drawCup(
      x,
      y,
      steamCount(timeOfDay),
      coffeeColour(coffeeType),
      company
    );
    fill(53, 38, 30);
textAlign(CENTER);
textSize(11);
text(place, x, y + 55);
text(date, x, y + 70);
  }
}
