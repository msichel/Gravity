Gravobject[] objs = new Gravobject[100];
float invgravpow = 2;
float inset = 5;
void setup()
{
  frameRate(60);
  size (500,500);
  noStroke();
  for (int i =0; i <objs.length; i++)
  {
    objs[i] = new Gravobject(new PVector(random(inset,width-inset),random(inset,height-inset)),PVector.random2D(),50);
  }
}
void draw()
{
  background(0);
  for(int i = 0; i<objs.length; i++)
  {
    objs[i].move();
    objs[i].display();
  }
  col();
  grav();
}
void grav()
{
  for(int i = 0; i<objs.length; i++)
  {
    for(int j = 0; j<objs.length; j++)
    {
      if(i!=j)
      {
        PVector gravity = new PVector(objs[j].p.x-objs[i].p.x,objs[j].p.y-objs[i].p.y);
        if(gravity.mag()>10)
        {
          float mag = objs[i].m*objs[j].m/pow(gravity.mag(),invgravpow);
          gravity.normalize();
          gravity.mult(mag);
          gravity.mult(1/objs[i].m);
          objs[i].v.add(gravity);
        }
      }
    }
  }
}
void col()
{
  for(int i = 0; i<objs.length; i++)
  {
    for(int j = 0; j<objs.length; j++)
    {
      if(i!=j)
      {
        objs[i].collide(objs[j]);
      }
    }
  }
}
