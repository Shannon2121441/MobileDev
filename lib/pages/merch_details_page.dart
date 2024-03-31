import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/components/button.dart';
import 'package:kms/models/shop.dart';
import 'package:kms/theme/colors.dart';
import 'package:provider/provider.dart';
import '../models/merch.dart';

class MerchDetailsPage extends StatefulWidget {
  final Merch merch;
  const MerchDetailsPage({super.key, required this.merch});

  @override
  State<MerchDetailsPage> createState() => _MerchDetailsPageState();
}

class _MerchDetailsPageState extends State<MerchDetailsPage> {
  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.merch, quantityCount);

      //let the user kow it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text(
            "Successfully added to cart",
            style: GoogleFonts.dmSans(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            //okay button
            IconButton(
              onPressed: () {
                //pop once to remove dialog box
                Navigator.pop(context);

                //pop again to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of merch
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.merch.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25),

                  //category, type, fandom, rating
                  Row(
                    children: [
                      // Category
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 141, 65, 229),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.merch.category,
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Type
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 141, 65, 229),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.merch.merchtype,
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Fandom
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 141, 65, 229),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.merch.fandom,
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Spacer to push the next items to the right side
                      Spacer(),

                      // Rating number
                      Text(
                        widget.merch.rating,
                        style: GoogleFonts.dmSans(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 5),

                      // Star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //name, artist, and heart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //merch name
                          Text(
                            widget.merch.name,
                            style: GoogleFonts.dmSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //artist
                          Text(
                            "By " + widget.merch.artist,
                            style: GoogleFonts.dmSans(
                              color: secondaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // Add your favorite action here
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  //description
                  Text(
                    "Description",
                    style: GoogleFonts.dmSans(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.merch.desc,
                    style: GoogleFonts.dmSans(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$${widget.merch.price}",
                      style: GoogleFonts.dmSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        //quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: GoogleFonts.dmSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        //plus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                //add to cart button
                MyButton(text: "Add to Cart", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
