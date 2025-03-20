import 'package:flutter/material.dart';
import '../widget/category_list_view.dart';
import '../widget/news_list_veiw_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(color: Colors.black)),
            Text('Cloud', style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
            const NewsListViewBulider(),
          ],
        ),
      ),
    );
  }
}
