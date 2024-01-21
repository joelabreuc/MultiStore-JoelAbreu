import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:joel_abreu_multistore_web_admin/views/screens/side_bar_screens/categories_screen.dart';
import 'package:joel_abreu_multistore_web_admin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:joel_abreu_multistore_web_admin/views/screens/side_bar_screens/orders_screen.dart';
import 'package:joel_abreu_multistore_web_admin/views/screens/side_bar_screens/products_screen.dart';
import 'package:joel_abreu_multistore_web_admin/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:joel_abreu_multistore_web_admin/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:joel_abreu_multistore_web_admin/views/screens/side_bar_screens/withdrawls_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget _selectedItem = DashboardScreen();

  screenSlector(item){
    switch(item.route){
      case DashboardScreen.routeName:
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case VendorsScreen.routeName:
        setState(() {
          _selectedItem = VendorsScreen();
        });
        break;
      case WithdrawalsScreen.routeName:
        setState(() {
          _selectedItem = WithdrawalsScreen();
        });
        break;
      case ProductsScreen.routeName:
        setState(() {
          _selectedItem = ProductsScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case UploadBannerscreen.routeName:
        setState(() {
          _selectedItem = UploadBannerscreen();
        });
      case OrdersScreen.routeName:
        setState(() {
          _selectedItem = OrdersScreen();
        });
        break;
    }
  }

    @override
      Widget build(BuildContext context){
          return AdminScaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Multistore Admin'),
            ),
            sideBar: SideBar(
              items: const [
                AdminMenuItem(
                  title: 'Dashboard',
                  route: DashboardScreen.routeName,
                  icon: Icons.dashboard,
                ),
                AdminMenuItem(
                  title: 'Vendors',
                  route: VendorsScreen.routeName,
                  icon: Icons.person_2,
                ),
                AdminMenuItem(
                  title: 'Withdrawal',
                  route: WithdrawalsScreen.routeName ,
                  icon: Icons.money,
                ),
                AdminMenuItem(
                  title: 'Products',
                  route: ProductsScreen.routeName,
                  icon: Icons.shop,
                ),
                AdminMenuItem(
                  title: 'Categories',
                  route: CategoriesScreen.routeName,
                  icon: Icons.category_outlined,
                ),
                AdminMenuItem(
                  title: 'Others',
                  route: OrdersScreen.routeName,
                  icon: Icons.shopping_cart,
                ),
                AdminMenuItem(
                  title: 'Upload Image Banner',
                  route: UploadBannerscreen.routeName,
                  icon: Icons.upload,
                ),
                AdminMenuItem(
                  title: 'Top Level',
                  icon: Icons.file_copy,
                  children: [
                    AdminMenuItem(
                      title: 'Second Level Item 1',
                      route: '/secondLevelItem1',
                    ),
                    AdminMenuItem(
                      title: 'Second Level Item 2',
                      route: '/secondLevelItem2',
                    ),
                    AdminMenuItem(
                      title: 'Third Level',
                      children: [
                        AdminMenuItem(
                          title: 'Third Level Item 1',
                          route: '/thirdLevelItem1',
                        ),
                        AdminMenuItem(
                          title: 'Third Level Item 2',
                          route: '/thirdLevelItem2',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              selectedRoute: '',
              onSelected: (item) {
                screenSlector(item);
              },
              header: Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xff444444),
                child: const Center(
                  child: Text(
                    'MultiStore Panel',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              footer: Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xff444444),
                child: const Center(
                  child: Text(
                    'footer',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            body: _selectedItem
          );
    }

  }



