import 'package:event_finder_app/models/event_model.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../event_detail_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(event: event),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: width * 0.025,
        ),
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow(context),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),

        child: Padding(
          padding: EdgeInsets.all(width * 0.035),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      event.imageUrl,
                      width: width * 0.22,
                      height: width * 0.22,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.imageTextShadow(context),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        event.category,
                        style: TextStyle(
                          color: AppColors.imageText(context),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: width * 0.04),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            event.title,
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary(context),
                            ),
                          ),
                        ),
                        Text(
                          event.distance,
                          style: TextStyle(
                            color: AppColors.kmColor(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: width * 0.015),

                    Text(
                      event.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textSecondary(context),
                        fontSize: width * 0.034,
                      ),
                    ),

                    SizedBox(height: width * 0.02),

                    Row(
                      children: [
                        Icon(Icons.calendar_today,
                            size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 6),
                        Text(
                          "${event.date} • ${event.time}",
                          style: TextStyle(
                            fontSize: width * 0.032,
                            color: AppColors.textSecondary(context),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 14, color: AppColors.textSecondary(context)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            event.location,
                            style: TextStyle(
                              fontSize: width * 0.032,
                              color: AppColors.textSecondary(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}