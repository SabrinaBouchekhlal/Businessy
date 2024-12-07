import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:businessy/views/widgets/home%20components/stockItemCard.dart';
import 'package:businessy/views/widgets/home%20components/top3ItemCard.dart';
import 'package:businessy/views/widgets/wallet%20components/goalProgressBar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    String businessName = 'Serine Crochet';
    String logo = 'assets/img/business_assets/SerineCrochetLOGO.png';

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: const Customappbar(title: 'Home'),
        drawer: CustomDrawer(logo: logo, business_name: businessName, index: 1),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome Back,',
                        style: HomeTypography.title,
                      ),
                      Text(
                        '$businessName!',
                        style: HomeTypography.title,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: Image.asset(
                      logo,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 80,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Quick Actions', style: HomeTypography.subtitle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: mainGreen,
                          // Set the background color for type 0 button
                          foregroundColor: whiteColor,
                          // Set the text color for type 0 button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Standard radius for all buttons
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          shadowColor: mainGreen,
                          // Green shadow color
                          elevation: 5, // Standard padding
                        ),
                        child: const Text('Record New Sales',
                            style: HomeTypography.buttonText),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: darkGrey,
                          // Set the background color for type 0 button
                          foregroundColor: whiteColor,
                          // Set the text color for type 0 button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Standard radius for all buttons
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          shadowColor: darkGrey,
                          // Green shadow color
                          elevation: 5,
                        ),
                        child: const Text('Pay Expenses',
                            style: HomeTypography.buttonText),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text('Goal Progress',
                          style: HomeTypography.subtitle),
                      GoalProgressBar(progressPercentage: 98, isHome: true,)
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Top 3 Sold Items',
                          style: HomeTypography.subtitle),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Top3ItemCard(
                              itemName: 'Handbag', itemNumber: '1'),
                          const SizedBox(height: 10),
                          Top3ItemCard(
                              itemName: 'Turtle Plush', itemNumber: '2'),
                          const SizedBox(height: 10),
                          Top3ItemCard(
                              itemName: 'Sweater', itemNumber: '3'),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      const Text('Low Stock Items',
                          style: HomeTypography.subtitle),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          StockItemCard(
                              itemName: ' Sweater',
                              quantityLeft: 1,
                              isOutOfStock: false),
                         
                        ],
                      )
                    ]),
                    Column(children: [
                      const Text('Out Of Stock Items',
                          style: HomeTypography.subtitle),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          StockItemCard(
                              itemName: 'Turtle Plush',
                              quantityLeft: 1,
                              isOutOfStock: true),
                          const SizedBox(height: 10),
                          
                        ],
                      )
                    ])
                  ])
            ],
          )),
        ));
  }
}
