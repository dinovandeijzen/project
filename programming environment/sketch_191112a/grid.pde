public class Grid{
  
  int id, row, cols,toggle;
  float x,y,w,h,bordersize,lim,acceleration,elasticity;
  String label;
  boolean drag,resize, init, border, fill,hover,count,wrap,move,attractor,circle,collide,cloth,partition,bounce,mouse,forward = true,backward,pause,randcolor;
  ArrayList<Grid_space> squares = new ArrayList<Grid_space>();
  
  //color col = color(255);
  Grid(float xx,float yy, float ww, float hh, int Row, int Col){
    
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    row = Row;
    cols = Col;
    bordersize = 1;
    
  }
  
  public void init(){
    float W = w/cols;
    float H = h/row;
    if(squares.size()<row*cols){
      
    for(int i=0;i<cols;i++){
      for(int j=0;j<row;j++){
        float x1 = (x + W * i);
        float y1 = (y + H * j);
        
        int num = i + j * cols;
        Grid_space a = new Grid_space(x1,y1,W,H,num);
        a.lim = lim;
        if(randcolor){
          a.col = color(random(255),random(255),random(255));
        }
        squares.add(a);
        
    }}}
    else{
      
    init = true;
  }
};

  void draw(){
    
    if(gridbox.toggle==1||toggle==1){
      gridbox.draw();
    }
    
    if(toggle==1){
      
    if(init){
      if(forward){
          
      //text(squares.size(), 1000, 20);
      for(int i=0;i<squares.size();i++){
        Grid_space a = squares.get(i);
        
        
          a.forward = true;
          a.backward = false;
          a.pause = false;
        
        strokeWeight(bordersize);
        stroke(0);
        if(lim>0){
          a.lim = lim;
        }
        if(!border){
          noStroke();
        }
        
        fill(a.col);
        if(a.pos()&&hover){
          fill(0,255,0);
        }
        else{
          fill(a.col);
        }
        if(!fill){
          noFill();
        }
        if(move){
          a.move();
        }
        if(attractor){
          
          a.attractors();
          //if(limit!=0){
          //   a.Limit(a.vx,limit);
          //   a.Limit(a.vy,limit);
          //}
          a.update();
        }
        if(mouse){
          if(acceleration!=0){
            a.ax = acceleration;
            a.ay = acceleration;
          }
          a.mouse();
          //if(limit!=0){
          // a.Limit(a.vx,limit);
          // a.Limit(a.vy,limit);
          //}
         a.update();
        }
        if(!circle){
          rect(a.x,a.y,a.w,a.h);
        }
        else{
          ellipse(a.x,a.y,a.w,a.h);
        }
        if(count){
          fill(0);
          text(a.id,a.x,a.y + a.h);
        }
        if(bounce){
          if(wrap){
            print("Cannot bounce and wrap! ");
          }
          else{
            if(elasticity!=0){
          a.elasticity = elasticity;
        }
        a.bounce();
        }}
        if(wrap){
          if(bounce){
            print("Cannot wrap and bounce! ");
          }
          else{
          a.wrap();
        }}
      }
    }
    else if(backward){
      for(int i=0;i<squares.size();i++){
        Grid_space a = squares.get(i);
        
        text(a.lim,100,10);
        strokeWeight(bordersize);
        stroke(0);
          a.forward = false;
          a.backward = true;
          a.pause = false;
          a.update();
         fill(a.col); 
         
         if(a.pos()&&hover){
          fill(0,255,0);
        }
          if(!circle){
          rect(a.x,a.y,a.w,a.h);
        }
        else{
          ellipse(a.x,a.y,a.w,a.h);
        }
        if(count){
          fill(0);
          text(a.id,a.x,a.y + a.h);
        }
      }
    }
    else if(pause){
        for(int i=0;i<squares.size();i++){
        Grid_space a = squares.get(i);
        
        text(a.lim,100,10);
        strokeWeight(bordersize);
        stroke(0);
          a.forward = false;
          a.backward = false;
          a.pause = true;
          a.update();
        fill(a.col);
        if(a.pos()&&hover){
          fill(0,255,0);
        }
          if(!circle){
          rect(a.x,a.y,a.w,a.h);
        }
        else{
          ellipse(a.x,a.y,a.w,a.h);
        }
        if(count){
          fill(0);
          text(a.id,a.x,a.y + a.h);
        }
      }
    }
  
    }
    else{
      //print("Please initialize grid! ");
    }}
    
  };
  
  void update(){
    
  }
}
