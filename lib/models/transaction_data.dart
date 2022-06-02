class TransactionData {

  final String title;
  final String status;
  final String otherPerson;
  final String time;
  final String date;
  final double amount;
  final String image;

  const TransactionData({
    required this.title,
    required this.status,
    required this.otherPerson,
    required this.time,
    required this.date,
    required this.amount,
    required this.image,

  });

  set title(String value) {
    title = value;
  }

  set status(String value) {
    status = value;
  }

  set otherPerson(String value) {
    otherPerson = value;
  }

  set time(String value) {
    time = value;
  }

  set date(String value) {
    date = value;
  }

  set amount(double value) {
    amount = value;
  }

  set image(String url) {
    image = url;
  }
}