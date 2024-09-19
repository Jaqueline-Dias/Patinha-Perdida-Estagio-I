import 'package:app_patinha/src/core/theme/patinha_perdida_theme.dart';
import 'package:app_patinha/src/modules/feed/post/post_page.dart';
import 'package:app_patinha/src/modules/help/help_page.dart';
import 'package:app_patinha/src/modules/home/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Drawer
      drawer: MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: PatinhaPerdidaTheme.violetDark),
        backgroundColor: PatinhaPerdidaTheme.greyLigth,
        //Boas vindas
        centerTitle: true,
        title: Text(
          "Patinha Perdida",
          style: TextStyle(
            color: PatinhaPerdidaTheme.violetDark,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      //Navegação entre páginas
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          PostPage(),
          HelpPage(),
        ],
      ),

      //BottomNavigationBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: GNav(
          gap: 8,
          activeColor: PatinhaPerdidaTheme.violetDark,
          padding: const EdgeInsets.all(16),
          onTabChange: (index) {
            setState(
              () {
                currentIndex = index;
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn,
                );
              },
            );
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              iconColor: PatinhaPerdidaTheme.violetLigth,
              text: 'Home',
            ),
            GButton(
              icon: Icons.pets_sharp,
              iconColor: PatinhaPerdidaTheme.violetLigth,
              text: 'Dados',
            ),
            GButton(
              icon: Icons.help,
              iconColor: PatinhaPerdidaTheme.violetLigth,
              text: 'Meus relatos',
            ),
          ],
        ),
      ),

      //Botão flutuante
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PatinhaPerdidaTheme.violetDark,
        extendedPadding: EdgeInsets.all(16),
        onPressed: () async {
          //  Validações
          Navigator.of(context).pushNamed('/report/first');
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          "Relatar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
