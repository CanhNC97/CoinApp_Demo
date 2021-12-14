class ChartModel {
 String? price;
 DateTime? time;

 ChartModel(this.price, this.time);
 @override
  String toString(){
   return 'ChartModel{price: $price,time: $time}';
 }
}
