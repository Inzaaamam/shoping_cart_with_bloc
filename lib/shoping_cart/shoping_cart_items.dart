import 'package:bloc_example/shoping_cart/model_class.dart';
class ShopingCardDataProvider {
  // List<ShopingCartModel> listItems =[];
  ShopData getShopItems() {
    // ignore: unused_local_variable
    List<ShopingCartItems> list = [
      ShopingCartItems(
          id: '1',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU',
          productname: 'Jwellery',
          price: 30,
          quantity: 10),
      ShopingCartItems(
          id: '2',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU',
          productname: 'Head Phone',
          price: 30,
          quantity: 5),
      ShopingCartItems(
          id: '3',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU',
          productname: 'Shose',
          price: 20,
          quantity: 6),
      ShopingCartItems(
          id: '4',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU',
          productname: 'Bat',
          price: 80,
          quantity: 10),
    ];
    return ShopData(shopitems: list);
  }
  ShopData getCartItems() {
    // ignore: unused_local_variable
    List<ShopingCartItems> list = [
      ShopingCartItems(
          id: '5',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU',
          productname: 'Jwellery',
          price: 30,
          quantity: 20),
      ShopingCartItems(
          id: '6',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU',
          productname: 'Head Phone',
          price: 30,
          quantity: 40),
      ShopingCartItems(
          id: '7',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU',
          productname: 'Shose',
          price: 20,
          quantity: 20),
      ShopingCartItems(
          id: '8',
          imagUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU',
          productname: 'Bat',
          price: 80,
          quantity: 45),
    ];
    return ShopData(shopitems: list);
  }
}
