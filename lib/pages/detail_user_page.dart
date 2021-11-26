import 'package:flutter/material.dart';
import 'package:eclipse_test_task/models/user.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _DetailUserPageState createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  // Для отображения имени пользователя
  Widget buildName() {
    return Center(
      child: Text(
        '${widget.user!.name}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Для отображения CatchPhrase
  Widget buildCatchPhrase() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(
                Icons.format_quote,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: '${widget.user!.company!.catchPhrase}',
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.grey),
            ),
            const WidgetSpan(
              child: Icon(
                Icons.format_quote,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Для отображения реквизитов
  Widget buildInfoGraph(IconData? iconData, String? data) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              iconData,
              size: 21,
            ),
          ),
          TextSpan(
              text: ': ${data}', style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxHeight = 12.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user!.username.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.account_circle_outlined, size: 220),
                ],
              ),
              buildName(),
              const SizedBox(height: sizedBoxHeight),
              buildCatchPhrase(),
              const SizedBox(height: sizedBoxHeight),
              buildInfoGraph(Icons.phone_iphone, widget.user!.phone), //Phone
              const SizedBox(height: sizedBoxHeight),
              buildInfoGraph(Icons.email_outlined, widget.user!.email), //Email
              const SizedBox(height: sizedBoxHeight),
              buildInfoGraph(Icons.web, widget.user!.website), //Website
              const SizedBox(height: sizedBoxHeight),
              buildInfoGraph(
                  Icons.business, widget.user!.company!.name), //Company name
              const SizedBox(height: sizedBoxHeight),
              buildInfoGraph(Icons.location_on_outlined,
                  '${widget.user!.address!.city}, ${widget.user!.address!.street}, ${widget.user!.address!.suite}'), //Address
              const SizedBox(height: sizedBoxHeight),
              buildInfoGraph(
                  Icons.person_outline,
                  widget.user!.company!
                      .bs), //user's position in company (business)
            ],
          ),
        ),
      ),
    );
  }
}
