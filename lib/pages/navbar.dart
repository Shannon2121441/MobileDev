import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/pages/menu_page.dart'; // Import your menu page
import 'package:kms/pages/auth_service.dart'; // Import AuthService

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Shannon Po',
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              's2121441@usls.edu.ph',
              style: GoogleFonts.dmSans(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('lib/images/girl.png')),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 155, 118, 242),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'Likes',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Likes tapped'),
          ),
          ListTile(
            leading: Icon(Icons.pending),
            title: Text(
              'Pending Orders',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Pending Orders tapped'),
          ),
          ListTile(
            leading: Icon(Icons.history_outlined),
            title: Text(
              'Order History',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Order History tapped'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Notification tapped'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Settings tapped'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log Out',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
                (route) => false,
              );
              AuthService.logout(context); // Pass the context to logout method
            },
          ),
        ],
      ),
    );
  }
}
