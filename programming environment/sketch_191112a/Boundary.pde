class Boundary{
  
  float x1,x2,y1,y2,w,h,x3,y3;
  PVector a;
  PVector b;
  int key1,key2,type;
  boolean toggle = false,mdown,mup = true,circle,square,bezier,tri,complex_pol,pol;
  float dx,dy;
  color col = color(255);
  ArrayList<Boundary> Boundaries = new ArrayList<Boundary>();
  Menu pallete = new Menu(0,200,90,300);
  ArrayList<Float> norm = new ArrayList<Float>();
  ArrayList<Integer> types = new ArrayList<Integer>();
  ArrayList<Float> theta = new ArrayList<Float>();
  ArrayList<PVector> temp = new ArrayList<PVector>();
  ArrayList<ArrayList> polytemp = new ArrayList<ArrayList>();
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
  
  Boundary(Float X1, Float Y1,Float X2, Float Y2){

    x1 = X1;
    y1 = Y1;
    x2 = X2;
    y2 = Y2;
    //type = 1;
    values.put("toggle",false);
  };
  
  Boundary(Float X1, Float Y1,float ww,float hh,int Type){

    x1 = X1;
    y1 = Y1;
    w = ww;
    h = hh;
    type = Type;
  };
  
  Boundary(){
    
    type = 0;
    values.put("toggle",false);
    values.put("square",false);
    values.put("tri",false);
    values.put("circle",false);
    values.put("bezier",false);
    pallete.border = true;
  };
  
  Boundary (Float X1, Float Y1,Float X2,Float Y2,Float X3, Float Y3){

    x1 = X1;
    y1 = Y1;
    x2 = X2;
    y2 = Y2;
    x3 = X3;
    y3 = Y3;
    type = 1;
    values.put("toggle",false);
  };
  
  //Line(PVector A, PVector B){

  //  a = A;
  //  b = B;
  //};
  
  void draw(){
    event_listener();
    //create_rect();
    //create_circle();
    //create_tri();
    //create_line();
    if(square){
       toggle = false;
       circle  =false;
       bezier = false;
       tri = false;
       pallete.draw();
    }
    if(circle){
       toggle = false;
       square  =false;
       bezier = false;
       tri = false;
       pallete.draw();
    }
    if(toggle){
       square = false;
       circle  =false;
       bezier = false;
       tri = false;
       pallete.draw();
    }
    if(tri){
       toggle = false;
       circle  =false;
       bezier = false;
       square = false;
       pallete.draw();
    }
    
    if(boundaries.size()>0){
    text(boundaries.get(boundaries.size()-1).type,1000,100);
    text(boundaries.size(),1000,110);
    }
    for(int i=0;i<Boundaries.size();i++){
      Boundary b = Boundaries.get(i);
      stroke(col);
      fill(0);
        if(b.type==0){
          if(pos(b)){
            stroke(0);
          }
        line(b.x1,b.y1,b.x2,b.y2);
        }
        else if(b.type==2){
          if(pos(b)){
            fill(255);
          }
          rectMode(CORNER);
          rect(b.x1,b.y1,b.w,b.h);
        }
        else if(b.type==3){
          if(pos(b)){
            fill(255);
          }
          ellipseMode(CORNER);
          ellipse(b.x1,b.y1,b.w,b.h);
        }
        
    }
    fill(0);
    for(int i=0;i<boundaries.size();i++){
      text(boundaries.get(i).type,Boundaries.get(i).x1,Boundaries.get(i).y1);
    }
  };
  
  void functions(){
    if (toggle){
      create();
    }
    else if (square){
      create_rect();
    }
    else if(circle){
      create_circle();
    }
    else if(tri){
      create_tri();
    }
    else if(bezier){
      create_bezier();
    }
    else if(pol){
      create_poligon();
    }
    else if(complex_pol){
      create_complex_poligon();
    }
  };
  
  void create_rect(){
    float ax = mouseX;
    float ay = mouseY;
    Boundary n;
    
    if (square&&mousePressed&&!open_menus&&shapes.toggle==0){
       
       mdown = true;
       ax = mouseX;
       ay = mouseY;
       
       temp.add(new PVector(ax,ay));
       dx = ax - temp.get(0).x;
       dy = ay - temp.get(0).y;
       
       
      strokeWeight(20);
      stroke(0);
      point(ax,ay);
      strokeWeight(1);
      stroke(col);
      rect(temp.get(0).x,temp.get(0).y,dx,dy);
      }
      if(mdown&&!mousePressed){
        text("hello",1000,50);
      if((temp.get(0).x!=temp.get(temp.size()-1).x&&temp.get(0).y!=temp.get(temp.size()-1).y)){
      Boundary a = new Boundary(temp.get(0).x,temp.get(0).y,dx,dy,2);
      a.type = 2;
      Boundaries.add (a);
      theta.add(atan2((temp.get(0).y + dy) - temp.get(0).y,(temp.get(0).x + dx) - temp.get(0).x));
      norm.add(atan2((temp.get(0).x + dx) - temp.get(0).x, (temp.get(0).y + dy) - temp.get(0).y));
      temp = new ArrayList<PVector>();
      mdown = false;
      
      }}
  };
  
  void create_circle(){
    float ax = mouseX;
    float ay = mouseY;
    
    Boundary n;
    if (circle&&mousePressed&&!open_menus&&shapes.toggle==0){
       
       mdown = true;
       ax = mouseX;
       ay = mouseY;
       
       temp.add(new PVector(ax,ay));
       dx = ax - temp.get(0).x;
       dy = ay - temp.get(0).y;
       
      strokeWeight(20);
      stroke(0);
      point(ax,ay);
      strokeWeight(1);
      stroke(col);
      ellipseMode(CORNER);
      ellipse(temp.get(0).x,temp.get(0).y,dx,dy);
      }
      if(mdown&&!mousePressed){
      if((temp.get(0).x!=temp.get(temp.size()-1).x&&temp.get(0).y!=temp.get(temp.size()-1).y)){
      Boundary a = new Boundary(temp.get(0).x,temp.get(0).y,dx,dy,3);
      a.type = 3;
      Boundaries.add (a);
      theta.add(atan2((temp.get(0).y + dy) - temp.get(0).y,(temp.get(0).x + dx) - temp.get(0).x));
      norm.add(atan2((temp.get(0).x + dx) - temp.get(0).x, (temp.get(0).y + dy) - temp.get(0).y));
      temp = new ArrayList<PVector>();
      mdown = false;
      
      }}
  };
  
  void create_tri(){
    float ax = mouseX;
    float ay = mouseY;
    Boundary n;
    
    if (toggle&&mousePressed&&!open_menus&&shapes.toggle==0){
       
       mdown = true;
       ax = mouseX;
       ay = mouseY;
       temp.add(new PVector(ax,ay));
      strokeWeight(20);
      stroke(0);
      point(ax,ay);
      strokeWeight(1);
      stroke(col);
      line(temp.get(0).x,temp.get(0).y,temp.get(temp.size()-1).x,temp.get(temp.size()-1).y);
      }
      if(mdown&&!mousePressed){
      if((temp.get(0).x!=temp.get(temp.size()-1).x&&temp.get(0).y!=temp.get(temp.size()-1).y)){
      n = new Boundary(temp.get(0).x,temp.get(0).y,temp.get(temp.size()-1).x,temp.get(temp.size()-1).y);
      n.type = 3;
      Boundaries.add (n);
      theta.add(atan2(temp.get(temp.size()-1).y - temp.get(0).y,temp.get(temp.size()-1).x - temp.get(0).x));
      norm.add(atan2(temp.get(temp.size()-1).x - temp.get(0).x, temp.get(temp.size()-1).y - temp.get(0).y));
      temp = new ArrayList<PVector>();
      
      }mdown = false;
    }
  };
  
  void create_poligon(){
    
  };
  void create_bezier(){
    
  }
  void create_complex_poligon(){
    
  };
  
  void create(){
    float ax = mouseX;
    float ay = mouseY;
    Boundary n;
    
    
    if (toggle&&mousePressed&&!open_menus&&shapes.toggle==0){
       
       
       mdown = true;
       ax = mouseX;
       ay = mouseY;
       temp.add(new PVector(ax,ay));
      strokeWeight(20);
      stroke(0);
      point(ax,ay);
      strokeWeight(1);
      stroke(col);
      line(temp.get(0).x,temp.get(0).y,temp.get(temp.size()-1).x,temp.get(temp.size()-1).y);
      }
      if(mdown&&!mousePressed){
      if((temp.get(0).x!=temp.get(temp.size()-1).x&&temp.get(0).y!=temp.get(temp.size()-1).y)){
      n = new Boundary(temp.get(0).x,temp.get(0).y,temp.get(temp.size()-1).x,temp.get(temp.size()-1).y);
      n.type = 0;
      Boundaries.add (n);
      theta.add(atan2(temp.get(temp.size()-1).y - temp.get(0).y,temp.get(temp.size()-1).x - temp.get(0).x));
      norm.add(atan2(temp.get(temp.size()-1).x - temp.get(0).x, temp.get(temp.size()-1).y - temp.get(0).y));
      temp = new ArrayList<PVector>();
      
      
      }mdown = false;
    }
  };
  
  void event_listener(){
        
        if(!toggle && values.get("toggle")){
          values.put("square",false);
          values.put("circle",false);
          values.put("tri",false);
          values.put("bezier",false);
          toggle = true;
          square = false;
          circle = false;
          bezier = false;
          tri = false;
          
        }
        else if(toggle &&!values.get("toggle")){
          toggle = false;
          //values.put("toggle",false);
        }
        if(!square && values.get("square")){
          values.put("toggle",false);
          values.put("circle",false);
          values.put("tri",false);
          values.put("bezier",false);
          square = true;
          toggle = false;
          circle = false;
          bezier = false;
          tri = false;
          //values.put("toggle",true);
        }
        else if(square &&!values.get("square")){
          square = false;
          
          //values.put("toggle",false);
        }
        if(!tri && values.get("tri")){
          values.put("square",false);
          values.put("circle",false);
          values.put("toggle",false);
          values.put("bezier",false);
          tri = true;
          square = false;
          toggle = false;
          circle = false;
          bezier = false;
          //values.put("toggle",true);
        }
        else if(tri &&!values.get("tri")){
          tri = false;
          //values.put("toggle",false);
        }
        if(!circle && values.get("circle")){
          values.put("square",false);
          values.put("toggle",false);
          values.put("tri",false);
          values.put("bezier",false);
          circle = true;
          square = false;
          toggle = false;
          bezier = false;
          tri = false;
          //values.put("toggle",true);
        }
        else if(circle &&!values.get("circle")){
          circle = false;
          //values.put("toggle",false);
        }
        if(!bezier && values.get("bezier")){
          values.put("square",false);
          values.put("circle",false);
          values.put("tri",false);
          values.put("toggle",false);
          bezier = true;
          square = false;
          toggle = false;
          circle = false;
          tri = false;
          //values.put("toggle",true);
        }
        else if(bezier &&!values.get("bezier")){
          bezier = false;
          //values.put("toggle",false);
        }
    };
    
    boolean pos(Boundary a){
      float X = mouseX;
      float Y = mouseY;
      boolean k = false;
      
      //for(int i=0;i<Boundaries.size();i++){
      //  Boundary a = Boundaries.get(i);
      //  fill(255);
      //  text("hello",1000,100);
      //  if(a.type==0){
      //    boolean b = check_lineP(new PVector(a.x1,a.y1),new PVector(a.x2,a.y2),new PVector(X,Y));
      //    if(b){
      //      k = true;
      //    }}
      //  if(a.type==2||a.type==3){
      //    if( X > a.x1 && X < a.x1 + a.w && Y > a.y1 && Y < a.y1 + a.h){
      //      k = true;
      //  }}}
      
      if(a.type==0){
        return check_lineP(new PVector(a.x1,a.y1),new PVector(a.x2,a.y2),new PVector(X,Y));
      }
      else if(a.type ==2|| a.type==3){
        return X > a.x1 && X < a.x1 + a.w && Y > a.y1 && Y < a.y1 + a.h;
      }
      //k = true;
      return k;
        
    };
    
    boolean check_lineP(PVector a, PVector b,PVector c){
    
    boolean k = false;
    float d1 = dist(a.x,a.y,b.x,b.y);
    float d2 = dist(a.x,a.y,c.x,c.y);
    float d3 = dist(b.x,b.y,c.x,c.y);
    float d4 = d2 + d3;
    
    
    //if(d5>=inc/2&&d6>=inc/2){
    if(d4 <= d1 + 0.05 && d4 >= d1 - 0.05){
      k = true;
    }
    return k;
  };
          
};

  PVector check_intersect(Boundary a, Boundary b){

    float a1 = a.y2 - a.y1;
    float b1 = a.x1 - a.x2;
    float c1 = a1 * a.x1 + b1 * a.y1;
    float a2 = b.y2 - b.y1;
    float b2 = b.x1 - b.x2;
    float c2 = a2 * b.x1 + b2 * b.y1;
    float denom = a1 * b2 - a2 * b1;
    
    if((a.x1==b.x1||a.x2==b.x2)&&(a.y1==b.y1||a.y2==b.y2)){
      
      return null;
    }
     else{
        
    Float X = (b2 *c1 - b1 * c2) / denom;
    Float Y = (a1 *c2 - a2 * c1) / denom;
    
    PVector p = new PVector(X,Y);   
      boolean Linea = ((p.x<a.x1&&p.x>a.x2)||(p.x>a.x1&&p.x<a.x2))||((p.y<a.y1&&p.y>a.y2)||(p.y>a.y1&&p.y<a.y2));
      boolean Lineb = ((p.x<b.x1&&p.x>b.x2)||(p.x>b.x1&&p.x<b.x2))||((p.y<b.y1&&p.y>b.y2)||(p.y>a.y1&&p.y<b.y2));
      
        if(Linea&&Lineb){
        
        //point(p.x,p.y);
        return p;
      }
      else{
      return null;
      }}
      
     
      
  };
