import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import '../constants.dart';
import '../controllers/navigator_controllers.dart';
import '../controllers/wallet_controller.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: mainDrawer(1),
        appBar: const MyAppBar(),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: MainItem(),
        ),
      ),
    );
  }
}

class MainItem extends StatelessWidget {
  const MainItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _walletController = Get.find<WalletController>();
    return Column(
      children: [
        GetBuilder<WalletController>(builder: (context) {
          if (_walletController.walletFood.isEmpty) {
            return Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: w / 1.01,
                  height: h / 4,
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 100),
                    child: Lottie.network(
                      "https://assets8.lottiefiles.com/packages/lf20_ZZ7nur.json",
                      animate: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    "No Data To Show!",
                    style: GoogleFonts.lato(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ));
          } else {
            return Expanded(
              child: Column(
                children: [
                  SizedBox(
                      width: w,
                      height: h / 15,
                      // color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: w / 3,
                            height: h / 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black),
                            child: Center(
                                child: Text(
                              "Total Item : ${_walletController.walletFood.length}",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          ),
                          Container(
                            width: w / 1.8,
                            height: h / 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red),
                            child: Center(
                                child: Text(
                              "Total Price : \$${_walletController.totalAmount().toStringAsFixed(2)}",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          )
                        ],
                      )),
                  SizedBox(
                    width: w,
                    height: h / 1.65,
                    child: ListView.builder(
                      itemCount: _walletController.walletFood.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: w,
                          height: h / 4.5,
                          child: Stack(children: [
                            Positioned(
                              top: 25,
                              right: 0,
                              child: FadeInLeft(
                                delay: Duration(
                                    milliseconds: (index / 0.5 * 100).toInt()),
                                child: Container(
                                  width: w / 1.3,
                                  height: h / 6,
                                  decoration: BoxDecoration(
                                      color: unSelectedColor,
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 221, 219, 219),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            offset: Offset(-7, 11))
                                      ]),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 3,
                              child: FadeInLeft(
                                delay: Duration(
                                    milliseconds: (index / 0.5 * 200).toInt()),
                                child: Spin(
                                  delay: Duration(
                                      milliseconds:
                                          (index / 0.5 * 250).toInt()),
                                  child: SizedBox(
                                    width: w / 2.5,
                                    height: h / 5,
                                    child: Hero(
                                      tag: _walletController
                                          .walletFood[index].id,
                                      child: Image.asset(
                                        _walletController.walletFood[index].img,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 170,
                              top: 40,
                              child: FadeInLeft(
                                delay: Duration(
                                    milliseconds: (index / 0.5 * 300).toInt()),
                                child: Text(
                                  _walletController.walletFood[index].title,
                                  style: GoogleFonts.oxygen(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 171,
                              top: 68,
                              child: FadeInLeft(
                                delay: Duration(
                                    milliseconds: (index / 0.5 * 400).toInt()),
                                child: Text(
                                  _walletController.walletFood[index].subtitle,
                                  style: GoogleFonts.oxygen(
                                      color: const Color.fromARGB(
                                          255, 135, 134, 134),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 171,
                              top: 95,
                              child: FadeInLeft(
                                delay: Duration(
                                    milliseconds: (index / 0.5 * 500).toInt()),
                                child: Text(
                                  "\$${_walletController.walletFood[index].price.toStringAsFixed(2)}",
                                  style: GoogleFonts.oxygen(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 26,
                                right: 20,
                                child: FadeInRight(
                                  delay: Duration(
                                      milliseconds:
                                          (index / 0.5 * 700).toInt()),
                                  child: Spin(
                                    delay: Duration(
                                        milliseconds:
                                            (index / 0.5 * 800).toInt()),
                                    child: IconButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              barrierDismissible: false,
                                              title: "Warning!",
                                              content: const Text(
                                                "Do you really wanna remove this Item from this list?",
                                                textAlign: TextAlign.center,
                                              ),
                                              confirmTextColor: Colors.white,
                                              onCancel: () {},
                                              onConfirm: () {
                                                _walletController
                                                    .removeSingleItem(index);
                                                Get.back();
                                              });
                                        },
                                        icon: const Icon(
                                          LineIcons.times,
                                          color: Colors.red,
                                        )),
                                  ),
                                ))
                          ]),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {},
                      minWidth: w,
                      height: h / 14,
                      child: Text(
                        "Order Now",
                        style: GoogleFonts.lato(fontSize: 18),
                      ),
                      color: unSelectedColor,
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    var _walletController = Get.find<WalletController>();
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.blue,
          size: 35,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        GetBuilder<WalletController>(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: _walletController.walletFood.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          barrierDismissible: false,
                          title: "Warning!",
                          content: const Text(
                            "Do you really wanna remove all items from this list?",
                            textAlign: TextAlign.center,
                          ),
                          confirmTextColor: Colors.white,
                          onCancel: () {},
                          onConfirm: () {
                            _walletController.removeAllItems();
                            Get.back();
                          });
                    },
                    icon: const Icon(
                      LineIcons.trash,
                      color: Colors.red,
                      size: 45,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      Get.find<NavigatorController>().changeNavBarIndex(0);
                    },
                    icon: const Icon(
                      LineIcons.plusCircle,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
          );
        }),
      ],
    );
  }
}
