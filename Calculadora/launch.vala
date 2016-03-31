public class Calculator : Gtk.Window {

  private Gtk.Entry _r; private Gtk.Button _clear;
  private Gtk.Button _1;  private Gtk.Button _2;  private Gtk.Button _3;
  private Gtk.Button _4;  private Gtk.Button _5;  private Gtk.Button _6;
  private Gtk.Button _7;  private Gtk.Button _8;  private Gtk.Button _9;
  private Gtk.Button _0;  private Gtk.Button _equal;  private Gtk.Button _dot;
  private Gtk.Button _op; private Gtk.Button _cp;
  private Gtk.Button _plus;  private Gtk.Button _minus;
  private Gtk.Button _mult;  private Gtk.Button _div;

  public Calculator (){
    this.title = "Calculator";
    this.border_width = 10;
    this.resize(200,200);
    try{this.icon = new Gdk.Pixbuf.from_file ("logo.png");}catch(Error e){stderr.printf ("Could not load application icon: %s\n", e.message);}
    this.destroy.connect(Gtk.main_quit);
    this.Appearance();
    this.Connect();
    }
  private void Appearance(){
    var grid = new Gtk.Grid();
    this._r = new Gtk.Entry();
    this._clear = new Gtk.Button.with_label ("Clear");this._equal = new Gtk.Button.with_label ("=");
    this._1 = new Gtk.Button.with_label ("1");this._2 = new Gtk.Button.with_label ("2");this._3 = new Gtk.Button.with_label ("3");
    this._4 = new Gtk.Button.with_label ("4");this._5 = new Gtk.Button.with_label ("5");this._6 = new Gtk.Button.with_label ("6");
    this._7 = new Gtk.Button.with_label ("7");this._8 = new Gtk.Button.with_label ("8");this._9 = new Gtk.Button.with_label ("9");
    this._0 = new Gtk.Button.with_label ("0");this._dot = new Gtk.Button.with_label (".");
    this._op = new Gtk.Button.with_label ("(");this._cp = new Gtk.Button.with_label (")");
    this._plus = new Gtk.Button.with_label ("+");this._minus = new Gtk.Button.with_label ("-");
    this._mult = new Gtk.Button.with_label ("*");this._div = new Gtk.Button.with_label ("/");

    this._r.set_hexpand(true);this._r.set_vexpand(true);
    this._1.set_vexpand(true);this._4.set_vexpand(true);
    this._7.set_vexpand(true);this._0.set_vexpand(true);

    this.add(grid);
    grid.attach(this._r,0,0,5,1);grid.attach(this._clear,3,1,2,1);
    grid.attach(this._1,0,1,1,1);grid.attach(this._2,1,1,1,1);grid.attach(this._3,2,1,1,1);
    grid.attach(this._4,0,2,1,1);grid.attach(this._5,1,2,1,1);grid.attach(this._6,2,2,1,1);
    grid.attach(this._7,0,3,1,1);grid.attach(this._8,1,3,1,1);grid.attach(this._9,2,3,1,1);
    grid.attach(this._dot,0,4,1,1);grid.attach(this._0,1,4,1,1);grid.attach(this._equal,2,4,1,1);
    grid.attach(this._op,3,2,1,1);grid.attach(this._cp,4,2,1,1);
    grid.attach(this._plus,3,3,1,1);grid.attach(this._minus,4,3,1,1);
    grid.attach(this._mult,3,4,1,1);grid.attach(this._div,4,4,1,1);
    show_all();
  }

  private void Connect(){
    this._clear.clicked.connect(  ()=> this._r.set_text(""));
    this._1.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"1"));
    this._2.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"2"));
    this._3.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"3"));
    this._4.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"4"));
    this._5.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"5"));
    this._6.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"6"));
    this._7.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"7"));
    this._8.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"8"));
    this._9.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"9"));
    this._0.clicked.connect(      ()=> this._r.set_text(this._r.get_text()+"0"));
    this._dot.clicked.connect(    ()=> this._r.set_text(this._r.get_text()+"."));
    this._op.clicked.connect(     ()=> this._r.set_text(this._r.get_text()+"("));
    this._cp.clicked.connect(     ()=> this._r.set_text(this._r.get_text()+")"));
    this._plus.clicked.connect(   ()=> this._r.set_text(this._r.get_text()+"+"));
    this._minus.clicked.connect(  ()=> this._r.set_text(this._r.get_text()+"-"));
    this._mult.clicked.connect(   ()=> this._r.set_text(this._r.get_text()+"*"));
    this._div.clicked.connect(    ()=> this._r.set_text(this._r.get_text()+"/"));
    this._equal.clicked.connect(  ()=>{
    var e = matheval.Evaluator.create(this._r.get_text());
    this._r.set_text("%g".printf(e.evaluate_x(0)));});
  }
}

void main (string[] args) {
  Gtk.init (ref args);
  new Calculator ();
  Gtk.main();
}
