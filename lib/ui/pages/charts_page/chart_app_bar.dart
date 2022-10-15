part of 'charts_page_view.dart';

class _ChartAppBar extends Positioned {
  _ChartAppBar(BuildContext context, String text)
      : super(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  context.go("/");
                },
                icon: const Icon(Icons.abc),
                color: Colors.transparent),
            title: Text(
              text,
            ),
          ),
        );
}
