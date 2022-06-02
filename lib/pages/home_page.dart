import 'package:faker/faker.dart';
import 'package:finance_management_app/helpers.dart';
import 'package:finance_management_app/models/models.dart';
import 'package:finance_management_app/models/transaction_data.dart';
import 'package:finance_management_app/theme.dart';
import 'package:finance_management_app/utilities/utilities.dart';
import 'package:finance_management_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[ 
        SliverToBoxAdapter(
          child: Stack(
            children: [
              const Positioned(
                child: Image(
                  image: AssetImage('assets/images/appImage/PagesImage.png'),
                )
              ),
              Column(
                children:const[
                  _TopSection(),
                  _InfoCard(),
                  _TransactionHistory(),
                ]
              ),
            ]
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _deligate
          ),
        )
      ]
    );
  }

  Widget _deligate(BuildContext context, int index) {
    return TransactionDetail(
      transactionData: TransactionData(
        title: faker.company.name(), 
        status: "Income",
        otherPerson: faker.person.name(),
        time: "12:00",
        date: Helpers.randomDate().toIso8601String(),
        amount: 123.05, 
        image: Helpers.randomPictureUrl(), 
      ),
    );
  }
}


// ----------------------------- Top Section -----------------------------
class _TopSection extends StatelessWidget {
  const _TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 40, bottom: 40),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good afternoon,",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TitleText(
                text: "Dashpuntsag Oidov"
              ),
            ],
          ),
          IconBackground(icon: Icons.notifications_outlined, onTap: () {print('hello moto');})
        ],
      ),
    );
  }
}


// ----------------------------- TransactionHistory Section -----------------------------
class _TransactionHistory extends StatelessWidget {
  const _TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transaction history", 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

// ----------------------------- InfoCard Section ------------------------------
class _InfoCard extends StatefulWidget {
  const _InfoCard({Key? key}) : super(key: key);

  @override
  State<_InfoCard> createState() => __InfoCardState();
}

class __InfoCardState extends State<_InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: HexColor.fromHex('#2F7E79'),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Text(
                            "Total Balance",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "\$ 2,234.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){ },
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_circle_down,
                          color: Colors.white,
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Income",
                            style: TextStyle(
                              color: HexColor.fromHex('#D0E5E4'),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    TitleText(text: " \$ 1823.00", size: 25, color: Colors.white,)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_circle_up,
                          color: Colors.white,
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Expenses",
                            style: TextStyle(
                              color: HexColor.fromHex('#D0E5E4'),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    TitleText(text: " \$ 1823.00", size: 25, color: Colors.white,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ------------------------------ See Again Section -----------------------------
class _SeeAgain extends StatefulWidget {
  const _SeeAgain({Key? key}) : super(key: key);

  @override
  State<_SeeAgain> createState() => _SeeAgainState();
}

class _SeeAgainState extends State<_SeeAgain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 0,
        child: SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 8, bottom: 16),
                child: Text(
                  'See again',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: AppColors.textFaded,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        child: _StoryCard(
                          storyData: StoryData(
                            name: faker.person.firstName(),
                            url: Helpers.randomPictureUrl(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// ----------------------------- StoryCard Section -----------------------------
class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

