import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/services/dio/dio_charts.dart';
import 'package:music_for_everyone/core/state_management/provider/provider_values.dart';
import 'package:music_for_everyone/ui/pages/search_page/m_search.dart';
import 'package:music_for_everyone/ui/pages/search_page/search_results_view.dart';
import 'package:music_for_everyone/ui/widgets/c_app_bar.dart';

import '../../widgets/button_with_dropdown.dart';
import '../../widgets/text_field_gradient.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  final ValueNotifier<MSearch> _mSearch = ValueNotifier<MSearch>(MSearch());

  Chart _chart = Chart.values.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CAppBar(context, title: context.texts.search),
      body: Padding(
        padding: AppPaddings.scaffold(context),
        child: Column(
          children: [
            TextFieldGradient(
              hintText: context.texts.search,
              suffixIcon: const Icon(Icons.search),
              onSubmitted: (p0) {
                _mSearch.value = MSearch(chart: _chart, query: p0);
              },
            ),
            Padding(
              padding: AppPaddings.verticalSmall(context),
              child: ButtonWithDropDown(
                items: context.provider<ProviderValues>().chartItems,
                onItemChange: (p0) {
                  _chart = Chart.values[p0];
                },
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _mSearch,
              builder: (context, value, child) {
                return SearchResultsView(search: value);
              },
            ),
          ],
        ),
      ),
    ).withBackFunc(context);
  }
}
