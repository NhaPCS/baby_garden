import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/search/provider/get_hot_keys_provider.dart';
import 'package:baby_garden_flutter/screen/search/provider/get_search_history_provider.dart';
import 'package:baby_garden_flutter/screen/search/provider/searching_provider.dart';
import 'package:baby_garden_flutter/screen/search/widget/hot_keys.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/chip_tag.dart';
import 'package:baby_garden_flutter/widget/input/search_bar.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'item/search_history_item.dart';
import 'item/search_product_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends BaseState<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final SearchingProvider _searchingProvider = SearchingProvider();
  final GetHotKeysProvider _getHotKeysProvider = GetHotKeysProvider();
  final GetSearchHistoryProvider _getSearchHistoryProvider =
      GetSearchHistoryProvider();

  @override
  void initState() {
    super.initState();
    _getHotKeysProvider.hotKeys();
    _getSearchHistoryProvider.searchHistory();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: SearchBar(
          padding: EdgeInsets.only(right: SizeUtil.smallSpace),
          hasBack: true,
          enable: true,
          searchTextController: _searchTextController,
          onSubmit: () {
            if (_searchTextController.text.trim().isEmpty) {
              _searchingProvider.clear();
            } else
              _searchingProvider.search(
                  context, _searchTextController.text.trim());
          },
          onSearchTextChanged: (s) {
            if (_searchTextController.text.trim().isEmpty) {
              _searchingProvider.clear();
              _getSearchHistoryProvider.searchHistory();
            }
          },
        ),
      ),
      body: Consumer<SearchingProvider>(
        builder: (BuildContext context, SearchingProvider searchProvider,
            Widget child) {
          if (searchProvider.searchResult == null) {
            return Consumer2<GetHotKeysProvider, GetSearchHistoryProvider>(
              builder: (BuildContext context, GetHotKeysProvider hotKeyProvider,
                  GetSearchHistoryProvider historyProvider, Widget child) {
                return ListView.builder(
                  itemCount: historyProvider.histories == null ||
                          historyProvider.histories.isEmpty
                      ? 1
                      : historyProvider.histories.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return HotKeys(
                        onHotKeyPress: (s) {
                          _searchTextController.text = s;
                          _searchingProvider.search(context, s);
                        },
                        onDeleteHistory: () {
                          _getSearchHistoryProvider
                              .deleteSearchHistory(context);
                        },
                        histories: historyProvider.histories,
                      );
                    }
                    return SearchHistoryItem(
                        onSearchItemPress: (t) {
                          _searchingProvider.search(context, t);
                        },
                        history: historyProvider.histories[index - 1]);
                  },
                );
              },
            );
          }
          if (searchProvider.searchResult.isEmpty) {
            return LoadingView(isNoData: true);
          } else
            return ListView.builder(
              itemCount: searchProvider.searchResult == null
                  ? 0
                  : searchProvider.searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                if (searchProvider.searchResult[index].runtimeType == String) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WidgetUtil.paddingWidget(
                          Text(
                            searchProvider.searchResult[index],
                            style: TextStyle(
                                color: ColorUtil.primaryColor,
                                fontSize: SizeUtil.textSizeDefault),
                          ),
                          padding: EdgeInsets.only(
                              left: SizeUtil.defaultSpace,
                              top: SizeUtil.smallSpace,
                              bottom: SizeUtil.smallSpace)),
                      WidgetUtil.getLine(margin: EdgeInsets.all(0))
                    ],
                  );
                } else
                  return SearchProductItem(
                      product: searchProvider.searchResult[index]);
              },
            );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _searchingProvider),
      ChangeNotifierProvider.value(value: _getHotKeysProvider),
      ChangeNotifierProvider.value(value: _getSearchHistoryProvider),
    ];
  }
}
