part of 'pages.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigatorViewModel(),
      child: Consumer<NavigatorViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            body: vm.tabs[vm.currentIndex],
            bottomNavigationBar: BottomNavBar(currentIndex: vm.currentIndex, onTap: vm.changeTab),
          );
        },
      ),
    );
  }
}
