class Gravobject
{
  PVector p;
  PVector v;
  float d;
  float m;
  Gravobject(PVector pin, PVector vin)
  {
    p=pin;
    v=vin;
    d = 10;
    m = 1;
  }
  Gravobject(PVector pin, PVector vin, float min)
  {
    p=pin;
    v=vin;
    d = 10;
    m = min;
    v.mult(random(10));
  }
  void move()
  {
    p.add(v);
//    PVector ex = new PVector(p.x-width/2,p.y-height/2);
//    ex.mult(0.00001);
//    p.add(ex);
  }
  void display()
  {
    fill(255);
    ellipse(p.x,p.y,d,d);
  }
  void collide(Gravobject g)
  {
    if (dist(p.x,p.y,g.p.x,g.p.y)<=d)
    {
//      if(p.x<g.p.x)
//      {
//        v.x = -abs(v.x);
//      }
//      if(p.x>g.p.x)
//      {
//        v.x = abs(v.x);
//      }
//      if(p.y<g.p.y)
//      {
//        v.y = -abs(v.y);
//      }
//      if(p.y>g.p.y)
//      {
//        v.y = abs(v.y);
//      }
      PVector i =new PVector(g.p.x-p.x,g.p.y-p.y);
      float ang = PVector.angleBetween(i,v);
      float iang = atan(i.y/i.x);
      ang = iang - ang;
      float vmag = v.mag();
      v= new PVector(vmag*cos(ang),vmag*sin(ang));
      v.mult(-.85);
    }
  }
}
