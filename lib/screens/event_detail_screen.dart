import 'package:event_finder_app/screens/widgets/button.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../utils/app_colors.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.pageBg(context),
      appBar: AppBar(
        title: Text(event.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary(context),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              child: Image.network(
                event.imageUrl,
                width: double.infinity,
                height: height * 0.32,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _infoRow(Icons.category, event.category),
                  _infoRow(Icons.calendar_today, event.date),
                  _infoRow(Icons.access_time, event.time),
                  _infoRow(Icons.location_on, event.location),

                  const SizedBox(height: 16),

                  Text(
                    "About Event",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary(context),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    event.description,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),

                  const SizedBox(height: 24),

                  Button(
                    title: 'Get Tickets',
                    onPressed: () {
                      print("Clicked");
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

}