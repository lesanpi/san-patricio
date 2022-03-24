import 'package:flutter/material.dart';
import 'package:san_patricio/bloc/plant_bloc.dart';
import 'package:san_patricio/models/PlantProduct.dart';
import 'package:san_patricio/pages/plant_details_page.dart';
import 'package:san_patricio/utils/constants.dart';
import 'package:san_patricio/widgets/circle_button.dart';
import 'package:san_patricio/widgets/my_app_bar.dart';
import 'package:san_patricio/widgets/plant_card.dart';

const _duration = Duration(milliseconds: 100);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final bloc = PlantProvider.of(context)!.bloc;
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = PlantProvider.of(context)!.bloc;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: MyAppBar(),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ValueListenableBuilder<double>(
            valueListenable: bloc.currentPage,
            builder: (context, currentPage, _) {
              return SizedBox(
                width: size.width,
                height: size.height - 120,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          "🪴 Nuestras plantas",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: constraints.maxHeight * 0.05),
                                child: Container(
                                  height: constraints.maxHeight * 0.95,
                                  width: constraints.maxWidth,
                                  child: PageView.builder(
                                    clipBehavior: Clip.none,
                                    controller: bloc.pageProductController,
                                    itemCount: bloc.plants.length,
                                    itemBuilder: (context, index) {
                                      final plant = bloc.plants[index];
                                      final result = currentPage - index;
                                      final sizeScale = -0.3 * result.abs() + 1;
                                      // final opacity = sizeScale.clamp(0.0, 1.0);
                                      final color = productColors[
                                          (index + 1) % productColors.length];
                                      final _borderRadius =
                                          BorderRadius.circular(20);

                                      return InkWell(
                                        borderRadius: _borderRadius,
                                        splashColor: Colors.black12,
                                        onTap: () {
                                          bloc.selectItem(index);
                                          Navigator.of(context)
                                              .push(PageRouteBuilder(
                                            pageBuilder:
                                                (context, animation, _) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: PlantDetailsPage(
                                                  plant: plant,
                                                  color: color,
                                                ),
                                              );
                                            },
                                          ));
                                        },
                                        child: Transform(
                                          alignment: Alignment.bottomCenter,
                                          transform: Matrix4.identity()
                                            ..setEntry(3, 2, 0.001)
                                            ..translate(
                                              0.0,
                                              0.0,
                                            )
                                            ..scale(sizeScale),
                                          child: PlantCard(
                                            plant: plant,
                                            color: color,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                              onTap: bloc.decreaseProductUnit,
                              text: "-",
                              size: 60),
                          const SizedBox(
                            width: 30,
                          ),
                          ValueListenableBuilder(
                            valueListenable: bloc.unitsHomePage,
                            builder: (BuildContext context, int value,
                                Widget? child) {
                              return AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  value.toString(),
                                  style: const TextStyle(
                                    fontSize: 35,
                                  ),
                                  textAlign: TextAlign.center,
                                  key: Key(
                                      bloc.plants[currentPage.round()].name),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          CircleButton(
                            onTap: bloc.increaseProductUnit,
                            text: "+",
                            size: 60,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
