/**
 * Array List Examples
 * - Scatterplot
 * - Line Chart
 */

import mqtt.*;

ArrayList<Float> list = new ArrayList<Float>();

MQTTClient client;

void setup() {
  size(1280, 1024, P3D);
  smooth(8);
  
  client = new MQTTClient(this);
  client.connect("mqtt://0.0.0.0:11883", "processing");
  client.subscribe("p7/tof");
}

void draw() {
  background(240);
  noFill();
  strokeWeight(5);
  noStroke();

  /* 1. Scatterplot */
  //fill(98, 66, 255);
  //for(int i=0; (i < list.size()); i++) {
  //  ellipse(i*10, height-list.get(i), 10, 10);
  //}

  /* 2. Line Chart */
  //stroke(98, 66, 255);
  //for(int i=0; (i < list.size()-1); i++) {
  //  line(i*10, height-list.get(i), (i+1)*10, height-list.get(i+1));
  //}

  /* ??? */
}

void messageReceived(String topic, byte[] payload) {
  list.add(float(new String(payload)));
  if(list.size() > 128) {
   list.remove(0); 
  }
}