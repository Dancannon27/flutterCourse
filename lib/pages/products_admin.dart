import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductsAdminPage(this.addProduct, this.deleteProduct);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Choose'),
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('Products Page'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  },
                )
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: _buildSideDrawer(context),
          appBar: AppBar(
            title: Text('Review Order Page'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Product',
                ),
                Tab(icon: Icon(Icons.list), text: 'My Products'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ProductCreatePage(addProduct), ProductListPage()],
          ),
        ));
  }
}
