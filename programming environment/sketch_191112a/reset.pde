void Reset(){
  
  if(reset.toggle==1&&reset.parent.toggle==1){
    reset_dialogue.toggle = 1;
    //reset_dialogue.toggle=1;
  //backgroundcol = 0;
  
  textSize(20);
  fill(0);
  text("Are you sure you want to exit?",W/2 - 130,H/2 - 3);
  textSize(12);
  reset_dialogue.draw();
  reset_dialogue.toggle  = 1;
  //yes.draw();
  //no.draw();
  //yes.highlight();
  //no.highlight();
  }
  if(no.toggle==1){
    reset.toggle = 0;
  }

  if(yes.toggle==1&&reset.parent.toggle==1&&reset.toggle==1){
    file.toggle =0;
    windows = new ArrayList<Window>();
    menus = new ArrayList<Menu>();
    buttons = new ArrayList<Button>();
    Sliders = new ArrayList<Slider>();
    qgrid = new ArrayList<Quad>();
    attractors = new ArrayList<Attractor>();
    int W = 1200, H = 660,gw = 10,gh = 10;
    gridtype = false;
    float kkkk = 0.1, gW = (W)/float(gw), gH = H/float(gh);;
    Button btn1,btn2,btn3,reset,attractor;
    Button grav;
    Grid g;
    Plot_2D plot;
    Menu file;
    
    buttons();
  }
};
