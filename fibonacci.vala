int main (string[] args){
  try{
    int init=int.parse(args[1]);
    int fin=int.parse(args[2]);
    string series="";
    int series1=1;
    int series2=1;
    if(init == 1 ){
      series=series+series1.to_string()+"\n"+series2.to_string()+"\n";
    }
    while(series2 <= fin){
      int temp = series1 + series2;
      series1=series2;
      series2=temp;
      if (series2 >= init && series2 <= fin){
        series=series+series2.to_string()+"\n";
      }
    }
    stdout.printf("%s",series);
    FileUtils.set_contents("fibonacciSequence.txt",series);
  }catch(FileError e){
    stderr.printf("%s\n",e.message);
  }
  return 0;
}
