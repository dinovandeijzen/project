void populate(){
  
 for (int j=0;j<gh;j++){
    for (int i=0;i<gw;i++){
      int id = i+j*gw;
      PVector p = new PVector(i*gW,j*gH);
      //float x = i*gW;
      //float y = j*gH;
      qgrid.add(new Quad(p,id));
    }}
}

class Quad{
  int id,iid;
  float x,y;
  PVector p;
  ArrayList<Grid_space> children  = new ArrayList<Grid_space>();
  
  Quad(PVector P,int ID){
    p = P;
    id = ID;
    x = p.x;
    y = p.y;
  };

  void draw(){
    strokeWeight(1);
    stroke(0);
    noFill();
    //fill(255);
    rect(p.x,p.y,gW,gH);
    //textSize(24);
    //text(id,x + gW/2, y + gH/2);
    //textSize(12);
  };
  
  void fillc(){
    fill(255);
    rect(p.x,p.y,gW,gH);
    
  }
  
};
