void buttons(){ 
  header = new Window(0,0,W,20);
  windows.add(header);
  footer = new Window(0,H-50,W,50);
  windows.add(footer);
  header.border = false;
  footer.border = true;
  footer.col = 0;
  plot = new Plot_2D(new PVector(W/2,H/2),1000,1000);
  plot.col = color(0,255,0);
  plot.line = true;
  //----------------------------------------------------
  // file----------------------------------------------
  file = new Menu(0,0,30,20,"File");
  menus.add(file);
  file.slide = true;
  file.border = false;
  btn1 = new Button(0,file.y+file.h,90,20,"Grid");
  btn1.parent = file;
  btn2 = new Button(0,file.y+file.h+20*1,90,20,"Plot 2D");
  btn2.parent = file;
  btn3 = new Button(0,file.y+file.h+20*2,90,20,"Plot 3D");
  btn3.parent = file;
  attractor = new Button(0,file.y+file.h+20*3,90,20,"Attractor");
  attractor.parent = file;
  
  reset = new Button(0,file.y+file.h+20*4,90,20,"Reset");
  reset.parent = file;
  
  file.items.add(btn1);
  file.items.add(btn2);
  file.items.add(btn3);
  file.items.add(attractor);
  file.items.add(reset);
  
  //file.visible = false;
  btn1.xoff = -2;
  btn1.yoff = +2;
  btn1.border = false;
  btn2.border = false;
  btn3.border = false;
  attractor.border = false;
  
  //-------------------------------------------------------------------
  shapes = new Menu(file.x + file.w,0,50,20,"Shapes");
  shapes.slide = true;
  shapes.border = false;
  btn11 = new Button(file.x + file.w ,shapes.y+shapes.h,90,20,"Line drawing");
  btn11.parent = shapes;
  btn11.border = false;
  btn12 = new Button(file.x + file.w ,shapes.y+shapes.h+20*1,90,20,"Ellipse");
  btn12.parent = shapes;
  btn12.border = false;
  btn13 = new Button(file.x + file.w ,shapes.y+shapes.h+20*2,90,20,"Rectangle");
  btn13.parent = shapes;
  btn13.border = false;
  btn14 = new Button(file.x + file.w ,shapes.y+shapes.h+20*3,90,20,"Bezier");
  btn14.parent = shapes;
  btn14.border = false;
  
  shapes.items.add(btn11);
  shapes.items.add(btn12);
  shapes.items.add(btn13);
  shapes.items.add(btn14);
  //shapes.items.add(btn11);
  menus.add(shapes);
  //---------------------------------------------------------------------------
  //gridbox--------------------------------------------------------------------
  gridbox = new Menu(W-70,H/2,70,100);
  gridbox.slide = false;
  btn8 = new Button(gridbox.x,gridbox.y,70,20,"Square");
  btn9 = new Button(gridbox.x,gridbox.y+20,70,20,"Circle");
  btn22= new Button(gridbox.x,gridbox.y+20*2,70,20,"Hide");
  btn23= new Button(gridbox.x,gridbox.y+20*3,70,20,"Graph");
  btn10= new Button(gridbox.x,gridbox.y+20*4,70,20,"Attractor");
  btn19= new Button(gridbox.x,gridbox.y+20*5,70,20,"Forward");
  btn20= new Button(gridbox.x,gridbox.y+20*6,70,20,"Backwards");
  btn21= new Button(gridbox.x,gridbox.y+20*7,70,20,"Pause");
  btn26= new Button(gridbox.x,gridbox.y+20*8,70,20,"Heading");
  btn24= new Button(gridbox.x,gridbox.y+20*9,70,20,"Reset");
  
  gridbox.items.add(btn8);
  gridbox.items.add(btn9);
  gridbox.items.add(btn22);
  
  gridbox.items.add(btn10);
  gridbox.items.add(btn19);
  gridbox.items.add(btn20);
  gridbox.items.add(btn21);
  gridbox.items.add(btn23);
  gridbox.items.add(btn26);
  gridbox.items.add(btn24);
  
  btn8.parent = gridbox;
  btn9.parent = gridbox;
  btn10.parent = gridbox;
  btn19.parent = gridbox;
  btn20.parent = gridbox;
  btn21.parent = gridbox;
  btn22.parent = gridbox;
  btn23.parent = gridbox;
  btn24.parent = gridbox;
  btn26.parent = gridbox;
  //-------------------------------------------------------------------------------------------
  //physics------------------------------------------------------------------------
  physics = new Menu(shapes.x + shapes.w,0,50,20,"Physics");
  physics.border = false;
  //physics.slide = true;
  btn15 = new Button(shapes.x + shapes.w ,shapes.y+shapes.h,100,20,"Gravity");
  btn15.parent = physics;
  btn15.border = false;
  btn16 = new Button(shapes.x + shapes.w ,shapes.y+shapes.h+20*1,100,20,"Electromagnetism");
  btn16.parent = physics;
  btn16.border = false;
  btn17 = new Button(shapes.x + shapes.w ,shapes.y+shapes.h+20*2,100,20,"Strong");
  btn17.parent = physics;
  btn17.border = false;
  btn18 = new Button(shapes.x + shapes.w ,shapes.y+shapes.h+20*3,100,20,"Weak");
  btn18.parent = physics;
  btn18.border = false;
  
  physics.items.add(btn15);
  physics.items.add(btn16);
  physics.items.add(btn17);
  physics.items.add(btn18);
  //physics.items.add(btn19);
  
  menus.add(physics);
  //--------------------------------------------------------------------------------------------------
  // grid---------------------------------------------------------------------------------------------
  g = new Grid(W/2-200,H/2-200,400,400,40,40);
  //g.graph = true;
  //g.circular = true;
  g.visible = true;
  //g.visible = false;
  //g2 = new Grid(W/2-50,H/2-50,100,100,50,50);
  //b = new Grid(
  //populate();
  //g.init();
  //g.count = true;
  g.randcolor = true;
  g.border = true;
  g.lim = 4;
  g.forward = true;
  //g.move = true;
  //g.attractor = true;
  //g.acceleration = 0.5;
  g.elasticity = 0.7;
  //g.bordersize = 0.1;
  g.fill = true;
  g.hover = true;
  //g.set("hover",true);
  //g.circle = true;
  //g.set("circle",true);
  g.wrap = true;
  //g.bounce = true;
  //g.mouse = true;
  g.attractor = true;
  //g.bounce = true;
  //thread("g.init");
  //g.heading = true;
  reset.toggle = 0;
  
  //--------------------------------------------------------------
  // sub menus------------------------------------------------------
  btn1.submenu = new Menu(btn1.x+btn1.w,btn1.y,70,20);
  btn3.submenu = new Menu(btn3.x+btn3.w,btn3.y,70,20);
  menus.add(btn1.submenu);
  menus.add(btn3.submenu);
  
  btn1.submenu.type = 1;
  btn1.submenu.parent = btn1;
  btn3.submenu.type = 1;
  btn3.submenu.parent = btn3;
  
  btn25 = new Button(btn3.x+btn3.w,btn3.y,70,20,"Test");
  
  btn4 = new Button(btn1.x+btn1.w,btn1.y,70,20,"Square");
  btn5 = new Button(btn1.x+btn1.w,btn1.y+20,70,20,"Circle");
  
  btn4.parent = file;
  btn5.parent = file;
  
  btn1.submenu.items.add(btn4);
  btn1.submenu.items.add(btn5);
  
  btn3.submenu.items.add(btn25);
  
  attractor.submenu = new Menu(attractor.x+attractor.w,attractor.y,70,20);
  menus.add(attractor.submenu);
  
  attractor.submenu.type = 1;
  attractor.submenu.parent = attractor;
  
  btn6 = new Button(attractor.x+attractor.w,attractor.y,70,20,"Show/Hide");
  btn6.border = false;
  btn7 = new Button(attractor.x+attractor.w,attractor.y+20,70,20,"On/Off");
  btn7.border = false;
  
  btn6.parent = file;
  btn7.parent = file;
  
  attractor.submenu.items.add(btn6);
  attractor.submenu.items.add(btn7);
  //-----------------------------------------------------------------------
  // reset-----------------------------------------------------------------
  
  reset_dialogue = new Menu(W/2 - 135,H/2 - 20,275,45,"Are you sure you want to exit?");
  reset.border = false;
  
  yes = new Button(W/2 - 135 ,H/2 - 20 + 25,140,20,"Yes");
  no = new Button(W/2 +5,H/2 - 20 + 25,135,20,"No");
  
  reset_dialogue.items.add(yes);
  reset_dialogue.items.add(no);
  yes.parent = reset_dialogue;
  no.parent = reset_dialogue;
   
   //-------------------------------------------------------------------------
   //textboxes---------------------------------------------------------------------
   textb1 = new TextArea(0,200,200,40,20,4);
   textboxes.add(textb1);
  
}
