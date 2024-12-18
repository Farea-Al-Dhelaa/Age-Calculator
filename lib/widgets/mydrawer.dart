import 'package:agecalculator/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart'; // تأكد من استيراد Provider
import 'package:agecalculator/utils/const.dart'; // تأكد من استيراد الألوان المطلوبة

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام Consumer للوصول إلى الـ ThemeProvider
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        // تغيير خلفية الـ Drawer بناءً على وضع الـ Theme
        return Drawer(
          backgroundColor: themeProvider.isDarkMode
              ? kbuttonColor
              : kprimaryColor,
          child: Container(
            color: themeProvider.isDarkMode ? kbuttonColor : kprimaryColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerHeader(themeProvider),
                _buildDrawerSection(
                  context: context,
                  items: [
                    _buildDrawerItem(
                      icon: Icons.date_range,
                      title: 'احسب عمرك',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to age calculator screen
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.share_outlined,
                      title: 'مشاركة التطبيق',
                      onTap: () {
                        Share.share('شارك تطبيق حساب العمر مع أصدقائك!');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                 Divider(color: themeProvider.isDarkMode ? kprimaryColor
                    : kbuttonColor, height: 1),
                _buildDrawerSection(
                  context: context,
                  items: [
                    _buildDrawerItem(
                      icon: Icons.settings_outlined,
                      title: 'الإعدادات',

                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.help_outline,
                      title: 'المساعدة',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Divider(color: themeProvider.isDarkMode ? kprimaryColor
                    : kbuttonColor, height: 1),  // تحديد لون الـ Divider
                _buildDrawerSection(
                  context: context,
                  items: [
                    _buildDrawerItem(
                      icon: Icons.logout,
                      title: 'تسجيل الخروج',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // A helper function to build individual list items in the drawer
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: kbuttonColor),
      title: Text(
        title,
        style: TextStyle(
          color: kbuttonColor,  // تحديد اللون النصي
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      dense: true,
      visualDensity: VisualDensity(horizontal: -4, vertical: -2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      tileColor: kprimaryColor.withOpacity(0.1), // تحديد اللون عند التحديد
    );
  }

  // A helper function to group drawer items into sections
  Widget _buildDrawerSection({
    required BuildContext context,
    required List<Widget> items,
  }) {
    return Column(
      children: items,
    );
  }

  // A helper function to build the header with profile image and info
  Widget _buildDrawerHeader(ThemeProvider themeProvider) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? kbuttonColor : kprimaryColor,  // تحديد اللون الخلفي بناءً على الوضع
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(1),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture with the letter 'F' inside a circle
            SizedBox(
              width: double.infinity,
              height: 100,
              child: CircleAvatar(
                foregroundColor: themeProvider.isDarkMode ? kprimaryColor : kbuttonColor,
                radius: 50,
                backgroundColor: kbuttonColor,
                child: Text(
                  'F',
                  style: TextStyle(
                    color: themeProvider.isDarkMode ? kprimaryColor : kprimaryColor,  // تحديد اللون للنص بناءً على الوضع
                    fontSize: 28, // Adjusted for a professional look
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
