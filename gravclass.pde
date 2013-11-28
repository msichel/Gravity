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
      if(p.x<g.p.x)
      {
        v.x = -abs(v.x);
      }
      if(p.x>g.p.x)
      {
        v.x = abs(v.x);
      }
      if(p.y<g.p.y)
      {
        v.y = -abs(v.y);
      }
      if(p.y>g.p.y)
      {
        v.y = abs(v.y);
      }
      v.mult(.85);
    }
  }
}
