import mqtt.*;

MQTTClient client;

boolean breathing = false;

ArrayList<Float> list = new ArrayList<Float>();

long breathStart = 0;

void setup() {
  size(1280, 720, P3D);
  smooth(8);

  client = new MQTTClient(this);
  client.connect("mqtt://0.0.0.0:11883", "processing");
  client.subscribe("p7/hum");
}

void draw() {
  if(breathing) {
    background(98, 66, 255);
  } else {
    background(240);  
  }
  
  fill(0);
  for(int i=0; i<list.size(); i++) {
    float h = map(list.get(i), 0, 5000, 0, 100);
    rect(i*20, height/2 - h/2, 20, h);
  }
}

void messageReceived(String topic, byte[] payload) {
  float v = float(new String(payload));
  println(v);
  
  boolean b = v > 55;
  
  if(b && !breathing) {
    breathing = true;
    breathStart = millis();
  } else if(!b && breathing) {
    breathing = false;
    list.add(float(int(millis() - breathStart)));
    breathStart = 0;
  }
  
  if(list.size() > 64) {
    list.remove(0);
  }
}
