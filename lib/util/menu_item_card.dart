import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../controller/data_controller.dart';

class menuitemCard extends StatelessWidget {
  menuitemCard(
      {Key? key,
      required this.dataController,
      required this.index,
      required this.variationdClickHandler})
      : super(key: key);

  final DataController dataController;
  int index;
  final Function variationdClickHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        variationdClickHandler();
      },
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(dataController
                      .userList!.data!.bestsellerProducts![index].image!),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(dataController.userList!.data!.bestsellerProducts![index].name!),
          const SizedBox(
            height: 10,
          ),
          Text(
              dataController.userList!.data!.bestsellerProducts![index].price!),
        ],
      ),
    );
  }
}
