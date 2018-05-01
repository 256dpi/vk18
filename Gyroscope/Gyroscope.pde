import mqtt.*;

MQTTClient client;

ArrayList<PVector> list = new ArrayList<PVector>();

void setup() {
  size(1280, 720, P3D);
  smooth(8);

  client = new MQTTClient(this);
  client.connect("mqtt://0.0.0.0:11883", "processing");
  client.subscribe("p7/gyr");
}

void draw() {
  for(PVector v : list) {
    v.z += 10;
  }

  background(0);
  strokeWeight(2);
  stroke(255);
  noFill();
  
  for(PVector v : list) {
    ellipse(v.x, v.y, v.z, v.z);
  }
}

void messageReceived(String topic, byte[] payload) { 
  String[] s = split(new String(payload), ',');

  float x = float(s[0]) / 10;
  float y = float(s[1]) / 10;
  float z = float(s[2]) / 10;

  list.add(new PVector(width/2 + x, height/2 + y, 100));
  
  if (list.size() > 500) {
    list.remove(0);
  }
}
