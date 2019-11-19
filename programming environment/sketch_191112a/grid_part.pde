void populate(){
  
 for (int j=0;j<gh;j++){
    for (int i=0;i<gw;i++){
      int id = i+j*gw;
      PVector p = new PVector(i*gW,j*gH);
      //float x = i*gW;
      //float y = j*gH;
      qgrid.add(new Quad(p,id,i,j));
    }}
}

Quad index(int a, int b,int c){
  
  if(a<0||a>c||b<0||b>c){
    return null;
  }else{
  
  return fields.get(a + b * c);
  }
};

class Quad{
  int id,iid,i,j;
  float x,y;
  PVector p;
  ArrayList<Grid_space> children  = new ArrayList<Grid_space>();
  ArrayList<Quad> neighbours  = new ArrayList<Quad>();
  boolean field, collision;
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
  
  
  Quad(PVector P,int ID,int I,int J){
    p = P;
    id = ID;
    x = p.x;
    y = p.y;
    i = I;
    j = J;
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
  
  void get_neighbours(){
    ArrayList<Quad> n = new ArrayList<Quad>();
    
    Quad topl = index(i-1,j-1,gw);
    Quad top = index(i,j-1,gw);
    Quad topr = index(i-1,j+1,gw);
    Quad right = index(i+1,j,gw);
    Quad btmr = index(i+1,j+1,gw);
    Quad bottom = index(i,j+1,gw);
    Quad btml = index(i-1,j+1,gw);
    
    if(topl!=null){
      n.add(topl);
    }
    if(top!=null){
      n.add(top);
    }
    if(topr!=null){
      n.add(topr);
    }
    if(right!=null){
      n.add(right);
    }
    if(btmr!=null){
      n.add(btmr);
    }
    if(bottom!=null){
      n.add(bottom);
    }
    if(btml!=null){
      n.add(btml);
    }
    
    neighbours = n;
    
  };
  
};
