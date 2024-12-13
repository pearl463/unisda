import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example dynamic username
    String userName = "John Doe"; // Replace with dynamic user name logic

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section inside a Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 24.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green.shade200,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, $userName",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1, // Prevents stretching and long lines
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '"Jesus Loves You"',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1, // Prevents stretching
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Today's Sharing Section inside a Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 24.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Sharing",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.green.shade700,
                            ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "May you find peace and rest on this holy day. Reflect on the word of God and let it guide your steps. Remember that the Sabbath is a day for spiritual renewal and connection.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Announcements Section with Scrollable Cards
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Important Announcements",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              // Scrollable Announcements List
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  AnnouncementCard(
                    title: "Emergency Meeting",
                    datePosted: "2024-12-01",
                    author: "Church Secretary",
                    type: "emergency",
                  ),
                  AnnouncementCard(
                    title: "Banns of Marriage",
                    datePosted: "2024-12-02",
                    author: "Pastor",
                    type: "banns of marriage",
                  ),
                  AnnouncementCard(
                    title: "Funeral Service",
                    datePosted: "2024-12-03",
                    author: "Elder Smith",
                    type: "funeral",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String datePosted;
  final String author;
  final String type;

  const AnnouncementCard({
    required this.title,
    required this.datePosted,
    required this.author,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color typeColor;

    // Assigning icons and colors based on the type of announcement
    switch (type) {
      case "emergency":
        iconData = Icons.warning_amber_outlined;
        typeColor = Colors.red;
        break;
      case "banns of marriage":
        iconData = Icons.favorite_outline;
        typeColor = Colors.pink;
        break;
      case "funeral":
        iconData = Icons.local_hospital_outlined;
        typeColor = Colors.grey;
        break;
      default:
        iconData = Icons.notifications;
        typeColor = Colors.green;
        break;
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              color: typeColor,
              size: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Posted on: $datePosted",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Author: $author",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Type: $type",
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: typeColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
