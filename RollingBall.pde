import ketai.sensors.*;

KetaiSensor sensor;
PVector v, pos;
int size = 150; 

void setup()
{
   fullScreen();
   sensor = new KetaiSensor(this);
   sensor.start();
   textAlign(CENTER);
   textSize(40);
   orientation(LANDSCAPE);
   v = new PVector();
   pos = new PVector(width/2, height/2);
}
 
 

void draw()
{
   background(0, 100, 0);
   fill(192, 0, 0);
   ellipse(pos.x, pos.y, size, size);
}

void onAccelerometerEvent(float x, float y, float z)
{
   float dt = 0.2;
   float k = 0.1;
   PVector a = new PVector(y, x, z);
   
   a = a.add(PVector.mult(v, -k));
   v = v.add(PVector.mult(a, dt));
   pos = pos.add(PVector.mult(v, dt));
}

void onGyroscopeEvent(float x, float y, float z)
{
   float dt = 0.2;
   PVector a = new PVector(y, x, z);
   
   v = v.add(PVector.mult(a, dt));
   pos = pos.add(PVector.mult(v, dt));
}
