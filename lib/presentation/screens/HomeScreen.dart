import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../data/viewmodel/HomeFeedViewModel.dart';
import '../widgets/card_groups/HC3Widget.dart';
import '../widgets/card_groups/HC5Widget.dart';
import '../widgets/card_groups/HC6Widget.dart';
import '../widgets/card_groups/HC9Widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeFeedViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(child: Image.asset("assets/fampaylogo.png", width: 86, height: 23)),
          const SizedBox(height: 16),
          if (viewModel.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (viewModel.error != null)
            Center(child: Text('Error: ${viewModel.error}'))
          else
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.secondaryColor,
                ),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await viewModel.fetchHomeFeed(); // Call your fetch method here
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 435,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: viewModel.cardsHC3.length > 1 ? Axis.horizontal : Axis.vertical,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: viewModel.cardsHC3.length,
                            itemBuilder: (context, index) => HC3Widget(model: viewModel.cardsHC3[index]),
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: viewModel.cardsHC6.length > 1 ? Axis.horizontal : Axis.vertical,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: viewModel.cardsHC6.length,
                            itemBuilder: (context, index) => HC6Widget(model: viewModel.cardsHC6[index]),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: viewModel.cardsHC5.length > 1 ? Axis.horizontal : Axis.vertical,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: viewModel.cardsHC5.length,
                            itemBuilder: (context, index) => HC5Widget(model: viewModel.cardsHC5[index]),
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: viewModel.cardsHC9.length > 1 ? Axis.horizontal : Axis.vertical,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: viewModel.cardsHC9.length,
                              itemBuilder: (context, index) => HC9Widget(model: viewModel.cardsHC9[index]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
