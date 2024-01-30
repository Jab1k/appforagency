// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repo/provider.dart';

class KarzinkaPage extends StatefulWidget {
  const KarzinkaPage({super.key});

  @override
  State<KarzinkaPage> createState() => _KarzinkaPageState();
}

class _KarzinkaPageState extends State<KarzinkaPage> {
  int cost = 0;
  int summa = 0;
  @override
  Widget build(BuildContext context) {
    final event = context.read<Mainprovider>();
    final state = context.watch<Mainprovider>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 212, 216),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 219, 219),
      ),
      body: SafeArea(
        child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.690,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          crossAxisCount: 2,
                        ),
              shrinkWrap: true,
              itemCount: state.karzinka.length,
              itemBuilder: (context, index) {
                return state.karzinka[index][2] != 0
                    ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(26)),
                          ),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                              child: Image.network(
                                "https://easymobile.uz/static/${state.karzinka[index][4]}",
                                height: 150,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          Center(
                            child: Text(
                              "${state.karzinka[index][0]}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            "${state.karzinka[index][3]}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${state.karzinka[index][5]}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              event.addfornew(
                                index: index,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: state.karzinka[index][2] != 0
                                  ? Container(
                                      width: double.infinity,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
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
                                              event.minimizefornew(
                                                index: index,
                                              );
                                            },
                                            child: const Icon(
                                              Icons.minimize_outlined,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${state.karzinka[index][2]}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              event.addfornew(
                                                index: index,
                                              );
                                            },
                                            child: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
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
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : const SizedBox.shrink();
              },
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                cost = 0;
                summa = 0;
                for (var element in state.karzinka) {
                  print(element);
                  cost = element[3].toInt() * element[2].toInt();
                  summa += cost;
                }
                print(summa);
                
              },
              child: Container(
                width: double.infinity,
                height: 77,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 213, 179, 179),
                      Colors.blue,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Buyurtma Berish",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
