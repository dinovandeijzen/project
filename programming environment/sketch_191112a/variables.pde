ArrayList<Window> windows = new ArrayList<Window>();
ArrayList<Menu> menus = new ArrayList<Menu>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Slider> Sliders = new ArrayList<Slider>();
ArrayList<Quad> qgrid = new ArrayList<Quad>();
ArrayList<Quad> fields = new ArrayList<Quad>();
ArrayList<Attractor> attractors = new ArrayList<Attractor>();
ArrayList<Boundary> boundaries = new ArrayList<Boundary>();
ArrayList<TextArea> textboxes = new ArrayList<TextArea>();
int W = 1200, H = 660,gw = 10,gh = 10;
color backgroundcol = 51;
boolean gridtype,restart,open_menus;
float kkkk = 0.1, gW = (W)/float(gw), gH = H/float(gh);;
Button btn1,btn2,btn3,reset,attractor,grid,d2_plot,d3_plot,btn4,btn5,btn6,btn7,btn8,btn9,yes,no;
Button btn10,btn11,btn12,btn13,btn14,btn15,btn16,btn17,btn18,btn19;
Button btn20,btn21,btn22,btn23,btn24,btn25,btn26,btn27,btn28,btn29;
Button btn30, btn31,btn32,btn33,btn34,btn35,btn36,btn37,btn38,btn39;
Button grav;
Window header,main,rightmenu,leftmenu,footer;
TextArea textb1,textb2,textb3,textb4,textb5,textb6,textb7,textb8,textb9,textb10,textb11,textb12,textb13;
Grid g,g2;
Boundary lines;
Plot_2D plot;
Menu file,gridbox,plotbox,reset_dialogue,shapes,physics;
