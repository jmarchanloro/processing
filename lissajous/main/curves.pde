class Curve
{
 ArrayList<PVector> curve;
 ArrayList<Integer> curveColor;
 
 Curve()
 {
   curve = new ArrayList<PVector>();
   curveColor = new ArrayList<Integer>();
   curveColor.add(int(random(255)));
   curveColor.add(int(random(255)));
   curveColor.add(int(random(255)));
 }

 
 void addPoint(PVector p)
 {
   curve.add(p);
 }
  
 void show()
 {
   stroke(255);
   strokeWeight(1);
   noFill();
   beginShape();
   
   for (PVector point : curve)
   {
     stroke(curveColor.get(0), curveColor.get(1), curveColor.get(2));
     vertex(point.x, point.y);
   }
   endShape();
 }
 
 void restart()
 { 
  curve.clear();
 }
}
