import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/ui/pages/home_page/home_page_view.dart';
import 'package:music_for_everyone/ui/pages/profile_page/profile_page_view.dart';
import 'package:music_for_everyone/ui/pages/services_page/services_page_view.dart';
import 'package:music_for_everyone/ui/pages/social_page/social_page_view.dart';
import 'package:music_for_everyone/ui/widgets/c_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../core/state_management/provider/provider_page.dart';

part 'body.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = context.providerListen<ProviderPage>().currentPage;
    return Scaffold(
      body: _Body(selectedPage: selectedPage),
      bottomNavigationBar: CBottomNavBar(selectedPage: selectedPage),
    );
  }
}
