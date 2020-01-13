float angle_col = 0;
float angle_row = 0;
float lastAngle = 0;
int w = 80; /* witdh of each circle */
int cols;
int rows;
float diameter = w - 10;
float radio = diameter/2;
Curve[][] lissajous_curve;
PVector[][] points;

void setup ()
{
  size(800, 800);
  cols = (width/w) - 1;
  rows = (height/w) - 1;
  lissajous_curve = new Curve[rows][cols];
  points = new PVector[rows][cols];
    
  for (int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      lissajous_curve[i][j] = new Curve();
      points[i][j] = new PVector(); 
    }
  }
}

void draw()
{
  background(0);
   
  for (int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      points[i][j] = new PVector(); 
    }
  }
  
  for (int i = 0; i < cols; i++)
  {
    float center_x = w + i*w + w/2;
    float center_y = w/2;
    strokeWeight(1);
    stroke(255);
    noFill();
    ellipse(center_x,center_y,diameter,diameter);
    float x = radio*cos(angle_col*(i+1));
    float y = radio*sin(angle_col*(i+1));
    strokeWeight(8);
    point(center_x+x, center_y+y);
    
    stroke(255,50);
    strokeWeight(1);
    line(center_x+x, center_y+y, center_x+x, height);
    
    for(int r = 0; r < rows; r++)
    {
      points[r][i].x = center_x+x;
    }
  }
  
  for (int i = 0; i < rows; i++)
  {
    float center_x = w/2;
    float center_y = w + i*w + w/2;
    strokeWeight(1);
    stroke(255);
    noFill();
    ellipse(center_x,center_y,diameter,diameter);
    float x = radio*cos(angle_row*(i+1));
    float y = radio*sin(angle_row*(i+1));
    strokeWeight(8);
    point(center_x+x, center_y+y);
    
    stroke(255,50);
    strokeWeight(1);
    line(center_x+x, center_y+y, width, center_y+y);
    
    for(int c = 0; c < cols; c++)
    {
      points[i][c].y = center_y+y;
    }
  }
  
  
  for (int i=0; i<rows; i++)
  {
    for(int j=0; j<cols; j++)
    {
        lissajous_curve[i][j].addPoint(points[i][j]);
        lissajous_curve[i][j].show();
    }
  }
  
  if (angle_row > 2*PI)
  {
      for (int i=0; i<rows; i++)
  {
    for(int j=0; j<cols; j++)
    {
        lissajous_curve[i][j].restart();
        angle_col= 0;
        angle_row= 0;
    }
  }
  }
  
  if ((angle_col - lastAngle) > 0.09)
  {
    saveFrame("frames//###.png");
    lastAngle = angle_col;
  }
  
  angle_col += 0.01;
  angle_row += 0.01;  
}
