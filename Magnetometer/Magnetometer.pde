import mqtt.*;

MQTTClient client;

float minX = 1000;
float maxX = -1000;
float minY = 1000;
float maxY = -1000;

float offX = 0;
float offY = 0;

void setup() {
  size(1280, 720, P3D);
  smooth(8);

  client = new MQTTClient(this);
  client.connect("mqtt://0.0.0.0:1883", "processing");
  client.subscribe("p7/mag");
  
  background(0);
  
  strokeWeight(2);
  stroke(255);
  noFill();
}

void draw() {}

void messageReceived(String topic, byte[] payload) { 
  String[] s = split(new String(payload), ',');

  float x = float(s[0]) * 1000;
  float y = float(s[1]) * 1000;
  float z = float(s[2]) * 1000;
  
  minX = min(x, minX);
  maxX = max(x, maxX);
  minY = min(y, minY);
  maxY = max(x, maxY);
  
  point(offX + width/2+x, offY + height/2+y);
}

void keyPressed() {
  offX = 0 - maxX + (maxX-minX)/2;  
  offY = 0 - maxY + (maxY-minY)/2;
  
  background(0);
}
