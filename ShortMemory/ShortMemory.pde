import mqtt.*;

ArrayList<Float> list = new ArrayList<Float>();

MQTTClient client;

void setup() {
  size(1280, 1024, P3D);
  smooth(8);
  
  client = new MQTTClient(this);
  client.connect("mqtt://0.0.0.0:1883", "processing");
  client.subscribe("p7/dst");
}

void draw() {
  background(240);
  noFill();
  strokeWeight(5);
  noStroke();

  /* 1. Circles */
  //fill(98, 66, 255);
  //for(int i=0; (i < list.size()); i++) {
  //  float v = constrain(map(list.get(i), 0, 500, 0, 20), 0, 20);
  //  ellipse(i*20, height/2, v, v);
  //}

  /* 2. Line Chart */
  //stroke(98, 66, 255);
  //for(int i=0; (i < list.size()-1); i++) {
  //  float v0 = map(list.get(i), 0, 1300, 0, height);
  //  float v1 = map(list.get(i+1), 0, 1300, 0, height);
  //  line(i*20, height-v0, (i+1)*20, height-v1);
  //}
  
  /* 3. Arc Grid */
  //fill(98, 66, 255);
  //for(int y=0; y<8; y++) {
  //  for(int x=0; x<8; x++) {
  //    int i = y*8+x;
  //    if(i >= list.size()) return;
      
  //    float xx = (x * width/8) + width/8/2;
  //    float yy = (y * height/8) + height/8/2;
  //    float v = map(list.get(i), 0, 1300, 0, TWO_PI);
      
  //    arc(xx, yy, 20, 20, 0, v);
  //  }
  //}
}

void messageReceived(String topic, byte[] payload) {
  list.add(float(new String(payload)));
  if(list.size() > 64) {
   list.remove(0); 
  }
}
