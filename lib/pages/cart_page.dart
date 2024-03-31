import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/components/button.dart';
import 'package:kms/models/merch.dart';
import 'package:kms/models/shop.dart';
import 'package:kms/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  // Remove from cart
  void removeFromCart(Merch merch, BuildContext context) {
    // Get access to shop
    final shop = context.read<Shop>();

    // Remove from cart
    shop.removeFromCart(merch);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) {
        // Group merchandise items by name and sum up quantities
        final Map<String, int> groupedMerch = {};
        value.cart.forEach((merch) {
          groupedMerch.update(merch.name, (value) => value + 1,
              ifAbsent: () => 1);
        });

        // Calculate total price
        double totalPrice = 0;
        value.cart.forEach((merch) {
          totalPrice += double.parse(merch.price);
        });

        return Scaffold(
          backgroundColor: Color.fromARGB(255, 231, 229, 237),
          appBar: AppBar(
            foregroundColor: Color.fromARGB(249, 255, 249, 249),
            elevation: 0,
            title: Text(
              "My Cart",
              style: GoogleFonts.dmSans(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: secondaryColor,
          ),
          body: Column(
            children: [
              // Customer cart
              Expanded(
                child: ListView.builder(
                  itemCount: groupedMerch.length,
                  itemBuilder: (context, index) {
                    // Get merch name and quantity
                    final String merchName = groupedMerch.keys.elementAt(index);
                    final int quantity = groupedMerch.values.elementAt(index);

                    // Find the first merch with the name
                    final Merch merch =
                        value.cart.firstWhere((item) => item.name == merchName);

                    // Get merch price and calculate total price for the item
                    final double itemTotalPrice =
                        double.parse(merch.price) * quantity;

                    // Return list tile
                    return Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 20,
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          merch
                              .imagePath, // Assuming imagePath points to the image asset
                          width: 40, // Adjust the size of the image as needed
                          height: 40,
                        ),
                        title: Text(
                          '$merchName x$quantity', // Display the quantity
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '\$$itemTotalPrice', // Display the total price for the item
                          style: GoogleFonts.dmSans(
                            color: Colors.grey[200],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey[300],
                          ),
                          onPressed: () => removeFromCart(merch, context),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Total price
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price:',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$$totalPrice',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Pay button
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                  text: "Pay Now",
                  onTap: () {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
