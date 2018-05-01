/**
 * Direct Mapping Examples
 * - Background Color
 * - Circle Diameter
 * - Rectangle Width
 * - Line Angle
 */

import mqtt.*;

MQTTClient client;

float v = 0;

void setup() {
  size(1280, 720, P3D);
  //fullScreen(P3D);

  client = new MQTTClient(this);
  client.connect("mqtt://0.0.0.0:11883", "processing");
  client.subscribe("p7/dst");

  smooth(8);
  background(0);
  
  // 98,66,255
}

void draw() {
  background(240);
  fill(98, 66, 255);
  noStroke();

  /* 1. Background Color */
  //fill(98, 66, 255, map(v, 0, 1300, 255, 0));
  //rect(0, 0, width, height);
  
  /* 2. Circle Diameter */
  //ellipse(width/2, height/2, v, v);
  
  /* 3. Rectangle Width */
  //rect(0, 0, map(v, 0, 1200, 0, width), height);
  
  /* 4. Line Angle */
  //float a = map(v, 0, 1300, 180, 360);
  //line(width/2, height, width/2 + cos(radians(a)) * 2000, height + sin(radians(a)) * 2000);
}

void messageReceived(String topic, byte[] payload) {
  v = float(new String(payload));
}
