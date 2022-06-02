import 'package:finance_management_app/helpers.dart';
import 'package:finance_management_app/models/transaction_data.dart';
import 'package:finance_management_app/screens/screens.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatelessWidget {

  const TransactionDetail({
    Key? key,
    required this.transactionData
    }) : super(key: key);

  final TransactionData transactionData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(TrasactionDetailScreen.route(transactionData));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10, right: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(Helpers.randomPictureUrl()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactionData.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )
                        ),
                        Text(
                          transactionData.date,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Text(
              (transactionData.status.toLowerCase() == "income" ?  "+ \$" : "- \$") + transactionData.amount.toString(),
              style: TextStyle(
                color: transactionData.status.toLowerCase() == "income" ? Colors.green : Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}