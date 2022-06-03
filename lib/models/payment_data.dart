class Payment{
  final String name;
  final String date;
  final double mount;
  final int img;
  final int status;

  // Transaction(this.name, this.date, this.mount, this.img, this.status);

  const Payment({
    required this.name,
    required this.date,
    required this.mount,
    required this.img,
    required this.status
  });

  set status(int value) {
    status = value;
  }

  set img(int value) {
    img = value;
  }

  set mount(double value) {
    mount = value;
  }

  set date(String value) {
    date = value;
  }

  set name(String value) {
    name = value;
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      name: json['name'],
      date: json['date'],
      mount: json['mount'],
      img: json['img'],
      status: json['status']
    );
  }
}