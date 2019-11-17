void settings(){
  size(W,H,FX2D);
}

void setup(){
  buttons();
  
}

void draw(){
  
  background(backgroundcol);
  
  g.init();
  plot.draw();
  g.draw();
  
  
  for(Menu menu : menus){
    menu.draw();
  }
  if(btn6.toggle==1^btn10.toggle==1){
  for(int i=0;i<attractors.size();i++){
      Attractor a = attractors.get(i);
      a.draw();
  }}
  fill(0);
  text(frameRate,1000,10);
  fill(255);
  
  text(shapes.toggle,1000,40);
  text(btn9.toggle,1000,50);
  text(btn10.toggle,1000,60);
  Reset();
};

void mousePressed(){
  
  float x = mouseX;
  float y = mouseY;
  if(btn7.toggle==1){
  if(mouseButton == LEFT && !file.pos() && file.toggle!=1 && ! gridbox.pos2()){
    //attractors.add(new Attractor(x,y,random(-0.1)));
    attractors.add(new Attractor(x,y,-0.1));
  }
  
  if(mouseButton == RIGHT && !file.pos() && file.toggle!=1 && ! gridbox.pos2()){
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
  btn4.toggle(g,"Square");
  btn5.toggle(g,"Circle");
  btn6.click();
  btn7.click();
  btn8.toggle(g,"Square");
  btn9.toggle(g,"Circle");
  btn10.click(btn7);
  
  btn19.toggle(g,"Forward");
  btn20.toggle(g,"Backward");
  btn21.toggle(g,"Pause");
};

void mouseDragged(){
  
  file.dpos();
}
