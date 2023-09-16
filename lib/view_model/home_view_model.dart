import 'package:untitled/models/product.dart';

class HomeViewModel{
  Product product = Product(name: "Laptop", quantity: 20);

  void buyOne(){
    product.quantity--;
  }

  int getProductQuantity(){
    return product.quantity;
  }
}