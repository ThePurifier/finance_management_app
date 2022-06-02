import 'package:finance_management_app/models/transaction_data.dart';
import 'package:finance_management_app/theme.dart';
import 'package:finance_management_app/widgets/avatar.dart';
import 'package:finance_management_app/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class TrasactionDetailScreen extends StatelessWidget {

  static Route route(TransactionData data) => MaterialPageRoute(
    builder: (context) => TrasactionDetailScreen(
      transactionData: data
    ),
  );


  const TrasactionDetailScreen({
    Key? key, 
    required this.transactionData
  }) : super(key: key);

  final TransactionData transactionData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        elevation: 0,
        leadingWidth: 54,
        title: const Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "Transaction Detail",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.textLigth
            )
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.more_horiz,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 15),
                    child: Avatar.large(url: transactionData.image,)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      transactionData.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.black
                      ),
                    ),
                  ),
                  Chip(
                    label: Text(
                      transactionData.status,
                      style: TextStyle(
                        color: (transactionData.status.toLowerCase() == 'income') ? Colors.green : Colors.red
                      ),
                    ),
                    backgroundColor: (transactionData.status.toLowerCase() == 'income') ? Colors.lightGreen[100] : Colors.pink[100],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Transaction Detail",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black
                                ),  
                              ),
                              Icon(Icons.more_horiz)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "From",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                transactionData.otherPerson,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ) 
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Time",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                transactionData.time,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ) 
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Date",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                transactionData.date,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ) 
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.85,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Earning",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                "\$ " + (transactionData.amount * 0.99).toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ) 
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Fee",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                "\$ " + (transactionData.amount * 0.01).toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ) 
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.85,
                          color: Colors.grey,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                "\$ " + transactionData.amount.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ) 
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),              
            )
          ]
        )
      )
    );
  }
}


