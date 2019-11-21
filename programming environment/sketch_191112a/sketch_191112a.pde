void settings(){
  size(W,H,FX2D);
}

void setup(){
  buttons();
  
}
int t;
void draw(){
  t = 0;
  background(backgroundcol);
  
  //g.heading = true;
  for(Window window : windows){
    window.draw();
  }
  header.draw();
  g.init();
  plot.draw();
  g.draw();
  
  for(Menu menu : menus){
    menu.draw();
    if(menu.toggle==1||menu.pos()){
      t ++;
    }
  }
  if(t>0){
    open_menus = true;
  }
  else{
    open_menus = false;
  }
  for(TextArea textb : textboxes){
    //textb.draw();
  }
  //lines.create_rect();
  lines.functions();
  lines.draw();
  for(Boundary Boundaries : boundaries){
    //Boundaries.Boundaries.draw();
  }
  if(btn6.toggle==1^btn10.toggle==1){
  for(int i=0;i<attractors.size();i++){
      Attractor a = attractors.get(i);
      a.draw();
  }}
  fill(0);
  text(frameRate,1000,10);
  fill(255);
  if(lines.square){
  text("square",1000,40);
  }
  if(lines.circle){
  text("circle",1000,50);
  }
  if(lines.tri){
  text("tri",1000,60);
  }
  if(lines.toggle){
  text("line",1000,70);
  }
  text(lines.Boundaries.size(),1000,50);
  text(btn11.toggle,1000,60);
  Reset();
};

void mousePressed(){
  
  float x = mouseX;
  float y = mouseY;
  if(btn7.toggle==1){
  if(mouseButton == LEFT && !file.pos() && file.toggle!=1 && ! gridbox.pos3()&& ! open_menus){
    //attractors.add(new Attractor(x,y,random(-0.1)));
    Attractor a = new Attractor(x,y,-0.1);
    a.type = 2;
    attractors.add(a);
    //g.pos = new ArrayList<PVector>();
  }
  
  if(mouseButton == RIGHT && !file.pos() && file.toggle!=1 && ! gridbox.pos3() && ! open_menus){
    //attractors.add(new Attractor(x,y,random(0.1)));
    Attractor a = new Attractor(x,y,0.1);
    a.type = 2;
    attractors.add(a);
  }}
  
  for(Menu menu : menus){
    menu.click();
  }
}

void mouseReleased(){
  
}
void mouseClicked(){
  
  reset.click();
  yes.click();
  no.click();
  btn1.onclick(g);
  btn2.onclick(plot);
  btn4.toggle2(g,"square");
  btn5.toggle2(g,"circle");
  btn6.click();
  btn7.click();
  btn8.toggle2(g,"square");
  btn9.toggle2(g,"circle");
  btn10.click();
  btn11.toggle2(lines,"toggle");
  btn12.toggle2(lines,"circle");
  btn13.toggle2(lines,"square");
  btn14.toggle2(lines,"bezier");
  btn19.toggle(g,"forward");
  btn20.toggle(g,"backward");
  btn21.toggle(g,"pause");
  btn22.toggle2(g,"visible");
  btn23.toggle2(g,"graph");
  btn24.toggle2(g,"reset");
  btn26.toggle2(g,"heading");
  btn27.toggle2(g,"intersect");
};

void mouseDragged(){
  
  file.dpos();
}
