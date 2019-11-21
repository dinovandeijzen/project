public class Grid{
  
  int id, row, cols,toggle;
  float x,y,w,h,bordersize,lim,acceleration,elasticity;
  String label;
  boolean drag,resize, init, border, fill,hover,count,wrap,move,attractor,circle,collide,cloth,partition,bounce,mouse,forward = true,backward,pause,randcolor,graph,circular;
  boolean visible = true,field = false,reset,heading,intersect;
  
  HashMap<String,Boolean> values = new HashMap<String,Boolean>();
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
    
    spawn();
  };
  
    public void init(){
      float W = w/cols;
      float H = h/row;
      if(!init){
        spawn();
      }
      if(squares.size()<row*cols){
        if(circular){
      for(int i=0;i<360;i+=W){
        for(int j=0;j<row;j++){
          float x1 = (x + W * i);
          float y1 = (y + H * j);
          float r = W;
          x1 = x+w/2 + (r/2+1)*j * cos(i);
          y1 = y+h/2 + (r/2+1)*j * sin(i);
          int num = i + j * cols;
          Grid_space a = new Grid_space(x1,y1,W,H,num);
          a.lim = lim;
          randcolor = true;
          if(randcolor){
            a.col = color(random(255),random(255),random(255));
          }
          squares.add(a);
          
      }}}
        else{
          for(int i=0;i<cols;i++){
            for(int j=0;j<row;j++){
              float x1 = (x + W * i);
              float y1 = (y + H * j);
              int num = i + j * cols;
              Grid_space a = new Grid_space(x1,y1,W,H,num);
              a.lim = lim;
              randcolor = true;
              if(randcolor){
                a.col = color(random(255),random(255),random(255));
              }
              squares.add(a);
          
                }}}}
                  else{
                    
                  init = true;
                }
      
                if(reset){
                  squares = new ArrayList<Grid_space>();
                  init = false;
                }
  };

  void draw(){
    event_listener();
    
    if(gridbox.toggle==1||toggle==1){
      gridbox.draw();
    }
    
    if(toggle==1){
      
    if(init){
      if(forward){
          
      //text(squares.size(), 1000, 20);
      for(int i=0;i<squares.size();i++){
        Grid_space a = squares.get(i);
          //fill(a.col);
          if(graph){
            a.graph = true;
          }
          else{
            a.graph = false;
          }
          a.forward = true;
          a.backward = false;
          a.pause = false;
          a.update();
          stroke(a.col);
          if(a.heading!=null&&heading){
            line(a.x,a.y,a.heading.x,a.heading.y);
          }
        strokeWeight(bordersize);
        stroke(0);
        if(lim>0){
          a.lim = lim;
        }
        if(!border){
          noStroke();
        }
        else{
          stroke(0);
        }
        if(a.pos()&&hover){
          fill(0,255,0);
        }
        else{
          fill(a.col);
        }
        if(!fill){
          noFill();
        }
        if(a.collide){
          fill(0);
        }
        else{
          fill(a.col);
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
        if(visible){
        if(!circle){
          rect(a.x,a.y,a.w,a.h);
        }
        else{
          
          ellipse(a.x,a.y,a.w,a.h);
        }
        if(count){
          fill(0);
          text(a.id,a.x,a.y + a.h);
        }}
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
          
          if(graph){
            a.graph = true;
          }
        
          a.forward = false;
          a.backward = true;
          a.pause = false;
          a.update();
         fill(a.col); 
         stroke(0);
         if(a.pos()&&hover){
          fill(0,255,0);
        }
        if(visible){
          if(!circle){
          rect(a.x,a.y,a.w,a.h);
        }
        else{
          ellipse(a.x,a.y,a.w,a.h);
        }
        if(count){
          fill(0);
          text(a.id,a.x,a.y + a.h);
        }}
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
  
  void set(String a,boolean b){
        values.put(a,b);
        //hover = true;
  };
  
  void spawn(){
    if(!field){
      values.put("field",false);
    }
    else{
      values.put("field",true);
    }
    values.put("drag",false);
    values.put("resize",false);
    values.put("init",false);
    if(!fill){
    values.put("fill",false);
    }
    else{
      values.put("fill",true);
    }
    if(!hover){
      values.put("hover",false);
    }
    else{
      values.put("hover",true);
    }
    if(!count){
      values.put("count",false);
    }
    else{
      values.put("count",false);
    }
    if(!wrap){
      values.put("wrap",false);
    }
    else{
      values.put("wrap",false);
    }
    if(! attractor){
      values.put("attractor",true);
    }
    else{
      values.put("attractor",true);
    }
    
    if(!circle){
      values.put("circle",false);
    }
    else{
      values.put("circle",true);
    }
    values.put("collide",false);
    values.put("cloth",false);
    values.put("partition",false);
    values.put("bounce",false);
    values.put("mouse",false);
    values.put("forward",true);
    values.put("backward",false);
    values.put("pause",false);
    if(!randcolor){
      values.put("randcolor",false);
    }
    else{
      values.put("randcolor",true);
    }
    if(!graph){
    values.put("graph",false);
    }
    else{
      values.put("graph",true);
    }
    if(!visible){
    values.put("visible",false);
    }
    else{
      values.put("visible",true);
    }
    visible = true;
    circle = true;
    
    values.put("reset",false);
    if(!heading){
    values.put("heading",false);
    }
    else{
      values.put("heading",true);
    }
    if(!intersect){
    values.put("intersect",false);
    }
    else{
      values.put("intersect",true);
    }
    
  };
  
  void event_listener(){
    
    if(drag&&!values.get("drag")){
       drag = true;
    }
    else if(!drag &&values.get("drag")){
      drag = true;
    }
    if(resize&&!values.get("resize")){
      resize = false;
    }
    else if(!resize &&values.get("resize")){
      resize = false;
    }
    if(fill&&!values.get("fill")){
      values.put("fill",true);
    }
    else if(!fill &&values.get("fill")){
      fill = false;
    }
    if(hover && !values.get("hover")){
      fill = true;
    }
    else if(!hover &&values.get("hover")){
      hover = true;
    }
    if(count && !values.get("count")){
      hover = false;
    }
    else if(!count &&values.get("count")){
      count = true;
    }
    if(wrap&&!values.get("wrap")){
      count = false;
    }
    else if(!wrap &&values.get("wrap")){
      wrap = true;
    }
    if(attractor&&!values.get("attractor")){
      wrap = false;
    }
    else if(!attractor &&values.get("attractor")){
      wrap = true;
    }
    if(circle&&!values.get("circle")){
      circle = false;
    }
    else if(!circle &&values.get("circle")){
      circle = true;
    }
    if(collide&&!values.get("collide")){
      collide = false;
    }
    else if(!collide &&values.get("collide")){
      collide = true;
    }
    if(cloth&&!values.get("cloth")){
      cloth = false;
    }
    else if(!cloth &&values.get("cloth")){
      cloth = true;
    }
    if(partition&&!values.get("partition")){
      partition = false;
    }
    else if(!partition&&values.get("partition")){
      partition = true;
    }
    if(bounce&&!values.get("bounce")){
      bounce = false;
    }
    else if(!bounce &&values.get("bounce")){
      bounce =true;
    }
    if(mouse&&!values.get("mouse")){
      mouse = false;
    }
    else if(!mouse &&values.get("mouse")){
      mouse = true;
    }
    if(forward && !values.get("forward")){
      forward = false;
    }
    else if(!forward &&values.get("forward")){
      forward = true;
    }
    if(backward &&!values.get("backward")){
      backward = false;
    }
    else if(!backward &&values.get("backward")){
      backward = true;
    }
    if(pause && !values.get("pause")){
      pause = false;
    }
    else if(!pause &&values.get("pause")){
      pause = true;
    }
    if(randcolor &&!values.get("randcolor")){
      randcolor = false;
    }
    else if(!randcolor &&values.get("randcolor")){
      randcolor = true;
    }
    if(graph&&!values.get("graph")){
      graph = false;
    }
    else if(!graph &&values.get("graph")){
      graph = true;
    }
    if(field&&!values.get("field")){
      field = false;
    }
    else if(!field &&values.get("field")){
      field = true;
    }
    if(visible&&!values.get("visible")){
      visible = false;
    }
    else if(!visible &&values.get("visible")){
      visible = true;
    }
    if(reset&&!values.get("reset")){
      reset = false;
    }
    else if(!reset &&values.get("reset")){
      reset = true;
    }
    if(heading&&!values.get("heading")){
      heading = false;
    }
    else if(!heading &&values.get("heading")){
      heading = true;
    }
    if(intersect&&!values.get("intersect")){
      intersect = false;
    }
    else if(!intersect &&values.get("intersect")){
      intersect = true;
    }
    
  };
  
  void update(){
    
  };
}
