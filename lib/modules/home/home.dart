import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pbl6/config/app_text_style.dart';
import 'package:pbl6/getxcontroller/cartcontroller.dart';
import 'package:pbl6/model/cart.dart';
import 'package:pbl6/model/order.dart';
import 'package:pbl6/modules/home/components/category_bar.dart';
import 'package:pbl6/modules/home/components/search_bar.dart';
import 'package:pbl6/modules/order/my_order.dart';
import 'package:pbl6/modules/profile/profile.dart';
import 'package:pbl6/testt.dart';
import '../cart/cart_shopping.dart';
import 'components/item_pages.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final CartController cartController = Get.put(CartController());
  final tabs = [
    Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        Expanded(child: ItemPages())
      ],
    ),
    Center(
      child: Text('cua hang'),
    ),
    Center(
      child: Text('ho tro'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'COMPUTER STORE',
            style: AppTextStyle.heading3Light,
          ),
          titleSpacing: 6,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                icon: Icon(Icons.person)),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyOrder()));
              },
              icon: Image.asset(
                'assets/images/icon_order.png',
                width: 20,
              ),
            ),
            Badge(
              label: Text('0'),
              textColor: Colors.white,
              alignment: AlignmentDirectional.topEnd,
              backgroundColor: Colors.grey,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartShopping()));
                },
                icon: const FaIcon(FontAwesomeIcons.cartShopping),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Colors.lightBlue,
          elevation: 20,
        ),
        body: Container(
          child: tabs[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          backgroundColor: Colors.lightBlue,
          selectedLabelStyle: AppTextStyle.heading3Light,
          unselectedLabelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.computer),
              label: 'Sản phẩm',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.store),
              label: 'Cửa hàng',
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.circleQuestion), label: 'Hỗ trợ'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
