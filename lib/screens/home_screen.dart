import 'package:event_finder_app/models/event_model.dart';
import 'package:event_finder_app/screens/widgets/event_card.dart';
import 'package:event_finder_app/services/api_service.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> events = [];
  List<Event> filteredEvents = [];

  bool isLoading = true;
  String? errorMessage;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  Future<void> getAllData() async {
    try {
      final data = await ApiService.fetchEvents();
      setState(() {
        events = data;
        filteredEvents = data;
        isLoading = false;
        errorMessage = null;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
        errorMessage = "Failed to load events";
      });
    }
  }

  void filterEvents(String query) {
    final result = events.where((event) {
      return event.title.toLowerCase().contains(query.toLowerCase()) ||
          event.location.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredEvents = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.pageBg(context),
      appBar: AppBar(
        title: const Text(
          "Event Finder",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary(context),
      ),

      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage != null
            ? Center(child: Text(errorMessage!))
            : Column(
          children: [

            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                  vertical: width * 0.02,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                decoration: BoxDecoration(
                  color: AppColors.card(context),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    filterEvents(value);
                    setState(() {}); // for clear icon update
                  },
                  style: TextStyle(color: AppColors.textPrimary(context)),

                  decoration: InputDecoration(
                    hintText: "Search events...",
                    hintStyle: TextStyle(
                      color: AppColors.textSecondary(context),
                    ),

                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.kmColor(context),
                    ),

                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        searchController.clear();
                        filterEvents("");
                        setState(() {});
                      },
                    )
                        : null,

                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            Expanded(
              child: RefreshIndicator(
                onRefresh: getAllData,
                child: filteredEvents.isEmpty
                    ? ListView(
                  children: [
                    SizedBox(height: width * 0.5),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.event_busy, size: 50, color: Colors.grey),
                          SizedBox(height: 10),
                          Text("No Events Found"),
                        ],
                      ),
                    ),
                  ],
                )
                    : ListView.builder(
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    final event = filteredEvents[index];
                    return EventCard(event: event);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}