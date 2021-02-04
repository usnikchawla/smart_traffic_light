boolean lane1_on = false;
float delay_light = 0;
int[] data_arr = {}; //no. of cars in lane 0 and lane 1 from txt file
int index = 0;
PFont font;
PFont font2;
boolean flag = true;
int cars_in_lane1;
int cars_in_lane2;
String[] lines = {};
String path = "C:\\Users\\Administrator\\Downloads\\deloitte_code_108_9_processing_sagemaker\\data\\data.txt";

void setup()
{
  size(850,650);
  font = loadFont("AgencyFB-Reg-48.vlw");
  font2 = loadFont("AgencyFB-Reg-100.vlw");
  textFont(font, 48);
  lines = loadStrings(path);
  data_arr = int(split(lines[0], ','));
  cars_in_lane1 = data_arr[0];
  cars_in_lane2 = data_arr[1];
  textAlign(CENTER);
  frameRate(1);
}

void draw()
{  
  if(delay_light == 0) decide();
  
  textFont(font, 48);
  background(255,255,255);
  fill(0, 0, 0);
  text("Lane 1", 100, 300);
  text("Lane 2", 750, 300);
  text("Timer", 400, 475);
  text(cars_in_lane1 + " vehicles", 100, 375);
  text(cars_in_lane2 + " vehicles", 750, 375);

  if(lane1_on){
    
  //lane1
  fill(0, 0, 0);
  circle(100, 50, 55);
  fill(0, 255, 0);
  circle(100, 150, 55);

  //lane2
  fill(255, 0, 0);
  circle(750, 50, 55);
  fill(0, 0, 0);
  circle(750, 150, 55);
  } 
  
  else {
    
  //lane1
  fill(255, 0, 0);
  circle(100, 50, 55);
  fill(0, 0, 0);
  circle(100, 150, 55);

  //lane2
  fill(0, 0, 0);
  circle(750, 50, 55);
  fill(0, 255, 0);
  circle(750, 150, 55);
  }

  fill(0, 0, 0);
  textAlign(CENTER);
  textFont(font2, 100);
  text(delay_light, 400, 600);
  if(delay_light>0){
    delay_light--;
  }
}

void decide()
{
  lane1_on = !lane1_on;
  
  
  lines = loadStrings(path);
  data_arr = int(split(lines[0], ','));
  cars_in_lane1 = data_arr[0];
  cars_in_lane2 = data_arr[1];
  
  if(lane1_on)
  delay_light = timer_function(cars_in_lane1);
  else
  delay_light = timer_function(cars_in_lane2);
}

float timer_function(int no_of_cars){
  if(no_of_cars == 0){
    return 5;
  } else if(no_of_cars <= 3){
    return 30;
  } else {
    return (2*(no_of_cars-3)) + 30;
  }
}
