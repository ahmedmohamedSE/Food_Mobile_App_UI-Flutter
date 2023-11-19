import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
//
import '../controllers/switch_controller.dart';
import '../controllers/wallet_controller.dart';
import '../constants.dart';
import '../controllers/food_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const MyFAB(),
          appBar: const MyAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: const [
                TopImage(),
                HeaderWidget(),
                MiddleDescription(),
                DeliveryTime(),
                BottomPrice()
              ],
            ),
          )),
    );
  }
}


class BottomPrice extends StatelessWidget {
  const BottomPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return FadeInDown(
      delay: const Duration(milliseconds: 1300),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          width: w / 4,
          height: h / 10,
          child: Column(
            children: [
              Text(
                "Total Price:",
                style: GoogleFonts.oxygen(
              color: Color.fromARGB(255, 90, 90, 90),
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10
              ),
              Text(
                "\$${Get.find<FoodController>().salads[_controller.currentSaladIndex].price.toStringAsFixed(2)}",
                style: GoogleFonts.oxygen(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return FadeInDown(
      delay: const Duration(milliseconds: 1100),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: w,
        height: h / 22,
        child: Row(
          children: [
            Text(
              "Delivery Time",
              style: GoogleFonts.oxygen(
                color: Color.fromARGB(255, 90, 90, 90),
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 15),
            const Icon(
              LineIcons.clock,
              color: Colors.grey,
            ),
            const SizedBox(width: 5),
            Text(
              Get.find<FoodController>()
                  .salads[_controller.currentSaladIndex]
                  .deliveryTime,
              style: GoogleFonts.oxygen(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiddleDescription extends StatelessWidget {
  const MiddleDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return FadeInDown(
      delay: const Duration(milliseconds: 900),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: w,
        height: h / 9,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              Get.find<FoodController>()
                  .salads[_controller.currentSaladIndex]
                  .description,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            )),
      ),
    );
  }
}

class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _foodController = Get.find<FoodController>();
    var _controller = Get.find<SwitchController>();
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.find<WalletController>().add(
            id: _foodController.salads[_controller.currentSaladIndex].id,
            img: _foodController.salads[_controller.currentSaladIndex].img,
            title: _foodController.salads[_controller.currentSaladIndex].title,
            subtitle:
                _foodController.salads[_controller.currentSaladIndex].subtitle,
            price: _foodController.salads[_controller.currentSaladIndex].price,
          );
        },
        child: const Icon(
          LineIcons.shoppingCart,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();

    return SizedBox(
      width: w,
      height: h / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInDown(
            delay: const Duration(milliseconds: 300),
            child: SizedBox(
              width: w / 1.6,
              child: Text(
                Get.find<FoodController>()
                    .salads[_controller.currentSaladIndex]
                    .title,
                style: GoogleFonts.oxygen(
                  fontSize: Get.find<FoodController>()
                              .salads[_controller.currentSaladIndex]
                              .title
                              .length <=
                          13
                      ? 26
                      : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 1),
            width: w / 3.4,
            height: h / 18,
            child: Row(
              children: [
                FadeInRight(
                  delay: const Duration(milliseconds: 600),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      onPressed: () {
                        Get.find<FoodController>()
                            .removeQ(_controller.currentSaladIndex);
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 700),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: GetBuilder<FoodController>(
                          id: "quantity",
                          builder: (context) {
                            return Text(
                              Get.find<FoodController>()
                                  .salads[_controller.currentSaladIndex]
                                  .quantity
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            );
                          })),
                ),
                FadeInLeft(
                  delay: const Duration(milliseconds: 400),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      onPressed: () {
                        Get.find<FoodController>()
                            .addQ(_controller.currentSaladIndex);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return Spin(
      delay: const Duration(milliseconds: 200),
      child: SizedBox(
        width: w,
        height: h / 2.3,
        child: Hero(
            tag: Get.find<FoodController>()
                .salads[_controller.currentSaladIndex]
                .id,
            child: Image.asset(
              Get.find<FoodController>()
                  .salads[_controller.currentSaladIndex]
                  .img,
            )),
      ),
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
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 30,
              ),
            ))
      ],
    );
  }
}
