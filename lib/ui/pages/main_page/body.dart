part of 'main_page_view.dart';

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
    required this.selectedPage,
  }) : super(key: key);

  final int selectedPage;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    
    _pageController = PageController(initialPage: widget.selectedPage);
  }

  @override
  void didUpdateWidget(covariant _Body oldWidget) {
    super.didUpdateWidget(oldWidget);

    _pageController.jumpToPage(widget.selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePageView(),
        ServicesPageView(),
        SocialPageView(),
        ProfilePageView(),
      ],
    );
  }
}
