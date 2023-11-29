class forTimer{

  int hour = 0;
  int minute = 0;
  int second = 0;

  forTimer({int hour = 0, int minute = 0, int second = 0}){
    this.hour = hour;
    this.minute = minute;
    this.second = second;
  }

  setHour({int hour = 0}){
    this.hour = hour;
  }
}