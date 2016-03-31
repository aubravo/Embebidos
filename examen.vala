int main (string [] args) {
    bool par;
    int min = int.parse(args[1]);
    int max = int.parse(args[2]);
    for (int xx=min; xx<=max; xx++){
        par =true;
        for (int xxx=2; xxx<xx; xxx++){
            if (xx%xxx==0){
                par =false;
            }
        }
        if (par == true) {
            stdout.printf(" %d ", xx);
        }
    }
    return 0;
}
