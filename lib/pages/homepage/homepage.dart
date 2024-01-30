// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../repo/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final event = context.read<Mainprovider>();
    final state = context.watch<Mainprovider>();
    final oliv =
        state.datas!.datas[state.datas!.datas.keys.toList()[state.current]];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 227, 231),
      body: state.isloading
          ? Lottie.asset("assets/splash.json")
          : SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    /// Tab Bar
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              state.datas?.datas.keys.toList().length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    event.indexpages(index, pageController);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(5),
                                    width: 100,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: state.current == index
                                          ? Colors.white70
                                          : Colors.white54,
                                      borderRadius: state.current == index
                                          ? BorderRadius.circular(12)
                                          : BorderRadius.circular(7),
                                      border: state.current == index
                                          ? Border.all(
                                              color: Colors.deepPurpleAccent,
                                              width: 2.5)
                                          : Border.all(
                                              color: Colors.grey, width: 2.5),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${state.datas?.datas.keys.toList()[index]}",
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: state.current == index,
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        shape: BoxShape.circle),
                                  ),
                                )
                              ],
                            );
                          }),
                    ),

                    /// MAIN BODY
                    Expanded(
                      child: GridView.builder(
                        itemCount: state
                            .datas!
                            .datas[
                                state.datas!.datas.keys.toList()[state.current]]
                            .length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.690,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(26)),
                               ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  child: Image.network(
                                    "https://easymobile.uz/static/${oliv[index][4]}",
                                    height: 150,
                                    width: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "${oliv[index][0]}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  "${oliv[index][3]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${oliv[index][5]}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    event.addnewtokarzinka(
                                        indexs: index, oliv: oliv);
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: oliv[index][2] != 0
                                          ? Container(
                                              width: double.infinity,
                                              height: 25,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(26)),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.blue,
                                                      Colors.white,
                                                    ],
                                                  )),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      event.minimazekarzinka(
                                                          index: index,
                                                          oliv: oliv);
                                                    },
                                                    child: const Icon(
                                                      Icons.minimize_outlined,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "${oliv[index][2]}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      event.addnewtokarzinka(
                                                          indexs: index,
                                                          oliv: oliv);
                                                    },
                                                    child:
                                                        const Icon(Icons.add),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(
                                              width: double.infinity,
                                              height: 25,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(26)),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.blue,
                                                      Colors.white,
                                                    ],
                                                  )),
                                              child: const Center(
                                                child: Text(
                                                  "Sotib Olish",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
