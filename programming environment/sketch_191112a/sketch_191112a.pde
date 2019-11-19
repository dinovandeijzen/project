void settings(){
  size(W,H,FX2D);
}

void setup(){
  buttons();
  
}

void draw(){
  
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
  }
  for(TextArea textb : textboxes){
    textb.draw();
  }
  if(btn6.toggle==1^btn10.toggle==1){
  for(int i=0;i<attractors.size();i++){
      Attractor a = attractors.get(i);
      a.draw();
  }}
  fill(0);
  text(frameRate,1000,10);
  fill(255);
  if(btn25.toggle==1){
  text("heading",1000,40);
  }
  text(btn9.toggle,1000,50);
  text(btn10.toggle,1000,60);
  Reset();
};

void mousePressed(){
  
  float x = mouseX;
  float y = mouseY;
  if(btn7.toggle==1){
  if(mouseButton == LEFT && !file.pos() && file.toggle!=1 && ! gridbox.pos3()){
    //attractors.add(new Attractor(x,y,random(-0.1)));
    attractors.add(new Attractor(x,y,-0.1));
    //g.pos = new ArrayList<PVector>();
  }
  
  if(mouseButton == RIGHT && !file.pos() && file.toggle!=1 && ! gridbox.pos3()){
    //attractors.add(new Attractor(x,y,random(0.1)));
    attractors.add(new Attractor(x,y,0.1));
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
  
  btn19.toggle(g,"forward");
  btn20.toggle(g,"backward");
  btn21.toggle(g,"pause");
  btn22.toggle2(g,"visible");
  btn23.toggle2(g,"graph");
  btn24.toggle2(g,"reset");
  btn26.toggle2(g,"heading");
};

void mouseDragged(){
  
  file.dpos();
}
